import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import { Status, Server } from 'App/Services'

export default class OnlineController {
  public status: Status = new Status();
  public server: Server = new Server();

  public async show(ctx: HttpContextContract) {
    try {
      const serverStatus = await this.status.getStatus(this.server.getHost(), this.server.getPort());
      return ctx.response.status(200).send({ status: 200, serverStatus});
    } catch(err) {
      console.log('Error getServerStatus: ', err);
      return ctx.response.status(400).send({ error: 'An error occurred, check the api console.'});
    }
  }
}
