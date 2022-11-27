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
      
      const pixRequest = await this.pix.pixRequest(agent);

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
      
      await this.pixRepository.create({
        account_id: data.account_id,
        value: Env.get('DOUBLE_POINTS') ? parseInt(data.value) * 2 : parseInt(data.value),
        status: 'WAITING',
        qrcode: qrcodeResponse.data.qrcode
      });

      const result = {
        image: qrcodeResponse.data.imagemQrcode,
        pix_qrcode: qrcodeResponse.data.qrcode
      }

      return ctx.response.status(200).send({ status: 200, result });
    } catch(err) {
      console.log('Error getQRCode: ', err);
      return ctx.response.status(400).send({ error: 'An error occurred, check the api console.'});
    }
  }

  public async webhook(ctx: HttpContextContract) {
    console.log(ctx.request.body())
    return 200;
  }
}
