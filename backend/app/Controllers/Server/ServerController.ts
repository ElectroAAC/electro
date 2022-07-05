import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import { Server } from 'App/Services'

export default class OnlineController {
  public server: Server = new Server();

  public async maxPlayers(ctx: HttpContextContract) {
    try {
      const maxPlayers = this.server.getMaxPlayers();

      return ctx.response.status(200).send({ status: 200, maxPlayers});
    } catch(err) {
      console.log('Error getServerStatus: ', err);
      return ctx.response.status(400).send({ error: 'An error occurred, check the api console.'});
    }
  }
}
