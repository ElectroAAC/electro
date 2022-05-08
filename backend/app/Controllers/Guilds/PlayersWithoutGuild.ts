import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import { CharacterView, GuildView } from 'App/Services'

export default class PlayersWithoutGuildController {
  public characterView: CharacterView = new CharacterView();
  public guildView: GuildView = new GuildView();
  
  public async show(ctx: HttpContextContract) {
    try {
      const account = ctx.auth.user;

      if (!account || !account.id) {
        return ctx.response.unauthorized();
      }

      const characters_account = await this.characterView.getByAccount(account.id);

      const characters_without_guild = await this.guildView.getCharactersWithoutGuild(account.id);

      console.log(characters_without_guild);

      const characters_with_guild: any = [];
      
      characters_account.forEach((character: any) => {
        if (!characters_without_guild.find((player: any) => player.id === character.id)) {
          characters_with_guild.push(character);
        }
      })

      return ctx.response.status(200).send({ status: 200, characters_with_guild });
    } catch(err) {
      console.log('Error getPlayersWithGuild Query: ', err);
      return ctx.response.status(400).send({ message: 'An error occurred, check the api console.'})
    }
  }
}
