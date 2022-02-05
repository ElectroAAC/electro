import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import { GuildService } from 'App/Services'

export default class PlayersWithGuildController {
  public guildService: GuildService = new GuildService();
  
  public async show(ctx: HttpContextContract) {
    try {
      const account = ctx.auth.user;

      if (!account || !account.id) {
        return ctx.response.unauthorized();
      }

      const character = await this.guildService.getCharactersWithGuild(account.id);

      return ctx.response.status(200).send({ status: 200, character });
    } catch(err) {
      console.log('Error getPlayersWithGuild Query: ', err);
      return ctx.response.status(400).send({ message: 'An error occurred, check the api console.'})
    }
  }
}
