import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import { 
  StoreValidator
} from 'App/Validators/Guilds/Invite'

import {
  CharacterView,
  Guild
} from 'App/Services'

import { Player } from 'App/Models';

export default class InviteController {
  public characterView: CharacterView = new CharacterView();
  public guild: Guild = new Guild();

  public async store(ctx: HttpContextContract) {
    try {
      const data = await ctx.request.validate(StoreValidator);

      const isLeaderOrVice = await this.guild.isLeaderOrVice(data.account_id, data.guild_id);

      if (!isLeaderOrVice)
        return ctx.response.status(404).send({ message: "You are not a leader or vice leader of guild"});

      const character = await this.characterView.getRankId(data.character_invitation) as Player[];

      if (!character.length && character[0].rank_id > 0)
        return ctx.response.status(404).send({ message: "The player already has a guild."});
      
      const alreadyInvited = await this.guild.alreadyInvited(data.guild_id, data.character_invitation);
      
      if (alreadyInvited)
        return ctx.response.status(404).send({ message: "Character is already invited to your guild"});
      
      const affectedRows = await this.guild.invitePlayer(data.guild_id, data.character_invitation);

      if (!affectedRows)
        return ctx.response.status(404).send({ message: "There was an error inviting the player to the guild. Contact the administrator."});

      return ctx.response.status(200).send({ status: 200, result: "Invitation sent successfully!" });
    } catch(err) {
      console.log('Error sendInvitation: ', err);
      return ctx.response.status(400).send({ message: err })
    }
  }
}
