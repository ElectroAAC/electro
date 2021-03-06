import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import { HighscoresService } from 'App/Services'

export default class HighscoresController {
  public highscoresService: HighscoresService = new HighscoresService();

  public async show(ctx: HttpContextContract) {
    try {
      const topRank = await this.highscoresService.topRankPlayers();

      return ctx.response.status(200).send({ result: topRank });
    } catch(err) {
      console.log('Error getTop5Players: ', err);
      return ctx.response.status(400).send({ error: 'An error occurred, check the api console.'});
    }
  }

  public async getRank(ctx: HttpContextContract) {
    try {
      const rank = await this.highscoresService.find(ctx.request.param('page'), ctx.request.param('limit'), ctx.request.param('type').replace(/%20/g, " "));
      
      return ctx.response.status(200).send({ status: 200, result: rank});
    } catch (err) {
      console.log('Error getRanking: ', err);
      return ctx.response.status(404).send({ error: 'An error ocurred, check the api console.' });
    }
  }
}
