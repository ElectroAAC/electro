import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import { GuildView } from 'App/Services'

export default class PlayersWithGuildController {
  public guildView: GuildView = new GuildView();
  
  public async show(ctx: HttpContextContract) {
    try {
      const account = ctx.auth.user;

      if (!account || !account.id) {
        return ctx.response.unauthorized();
      }

      const character = await this.guildView.getCharactersWithGuild(account.id);

      return ctx.response.status(200).send({ status: 200, character });
    } catch(err) {
      console.log('Error getPlayersWithGuild Query: ', err);
      return ctx.response.status(400).send({ message: 'An error occurred, check the api console.'})
    }
  }
}
