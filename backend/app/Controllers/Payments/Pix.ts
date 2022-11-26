import Env from '@ioc:Adonis/Core/Env'
import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import { StoreValidator } from 'App/Validators/Shop/Payment/Pix'
import {
  Pix,
  PixRepository,
  PixView
} from 'App/Services'

export default class PixController {
  public pix: Pix = new Pix();
  public pixRepository: PixRepository = new PixRepository();
  public pixView: PixView = new PixView();

  public async getQRCode(ctx: HttpContextContract) {
    try {
      const data = await ctx.request.validate(StoreValidator);

      const cert = await this.pix.loadCertificate();
      const agent = await this.pixView.getAgent(cert);
      
      const pixRequest = await this.pixRepository.pixRequest(agent);

      const pixOptions = {
        calendario: {
          expiracao: Env.get('PIX_TIME_EXPIRATION')
        },
        valor: {
          original: `${data.value}`
        },
        chave: Env.get('PIX_KEY'),
        solicitacaoPagador: Env.get('PIX_MESSAGE_ON_BILLING')
      };

      const cobResponse = await pixRequest.post('/v2/cob', pixOptions);
      const qrcodeResponse = await pixRequest.get(`/v2/loc/${cobResponse.data.loc.id}/qrcode`);

      return qrcodeResponse.data.imagemQrcode;
    } catch(err) {
      console.log('Error getQRCode: ', err);
      return ctx.response.status(400).send({ error: 'An error occurred, check the api console.'});
    }
  }
}
