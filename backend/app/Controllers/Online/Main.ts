import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import { OnlineService } from 'App/Services'

export default class OnlineController {
  public onlineService: OnlineService = new OnlineService();

  public async show(ctx: HttpContextContract) {
    try {
      const playersOnline = await this.onlineService.getPlayersOnline();
      
      const serverRecord = await this.onlineService.getRecord(0);
      
      const result = {
        serverRecord,
        playersOnline
      };

      return ctx.response.status(200).send({ status: 200, result});
    } catch(err) {
      console.log('Error getPlayersOnline Query: ', err);
      return ctx.response.status(400).send({ error: 'An error occurred, check the api console.'});
    }
  }
}
