import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import { GuildView } from 'App/Services';

export default class GuildsController {
  public guildView: GuildView = new GuildView();

  public async show(ctx: HttpContextContract) {
    try {
      await ctx.bouncer.with('DashboardPolicy').authorize('viewList');

      const accounts = await this.guildView.getTotalGuilds();

      return ctx.response.status(200).send({ result: accounts});
    } catch(err) {
      console.log('Error getTotalGuilds Query: ', err);
      return ctx.response.status(400).send({ message: 'An error occurred, check the api console.'})
    }
  }
}
