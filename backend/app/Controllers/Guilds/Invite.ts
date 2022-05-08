import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import { 
  DeleteValidator,
  IndexValidator,
  StoreValidator,
  UpdateValidator
} from 'App/Validators/Guilds/Invite'

import {
  CharacterView,
  Guild
} from 'App/Services'

import { Player } from 'App/Models';

export default class InviteController {
  public characterView: CharacterView = new CharacterView();
  public guild: Guild = new Guild();

  public async index(ctx: HttpContextContract) {
    try {
      const data = await ctx.request.validate(IndexValidator);

      const account = ctx.auth.user;

      if (!account) {
        return ctx.response.status(404).send({ message: "Invalid account."});
      }

      const isLeaderOrVice = await this.guild.isLeaderOrVice(account.id, data.guild_id);

      if (!isLeaderOrVice)
        return ctx.response.status(404).send({ message: "You are not a leader or vice leader of guild"});
      
      const invites = await this.guild.getInvitationsAndPlayers(data.guild_id);

      return ctx.response.status(200).send({ status: 200, result: invites });
    } catch(err) {
      console.log('Error sendInvitation: ', err);
      return ctx.response.status(400).send({ message: err })
    }
  }

  public async store(ctx: HttpContextContract) {
    try {
      const data = await ctx.request.validate(StoreValidator);

      const account = ctx.auth.user;

      if (!account) {
        return ctx.response.status(404).send({ message: "Invalid account."});
      }

      const isLeaderOrVice = await this.guild.isLeaderOrVice(account.id, data.guild_id);

      if (!isLeaderOrVice)
        return ctx.response.status(404).send({ message: "You are not a leader or vice leader of guild"});

      const character: any = await this.characterView.getByName(data.character_invitation) as Player[];

      character[0].rank_id = await this.characterView.getRankId(character[0].id);

      if (character[0].rank_id.length && character[0].rank_id[0].rank_id > 0)
        return ctx.response.status(404).send({ message: "The player already has a guild."});
      
      const alreadyInvited = await this.guild.alreadyInvited(data.guild_id, character[0].id);
      
      if (alreadyInvited)
        return ctx.response.status(404).send({ message: "Character is already invited to your guild"});
      
      const affectedRows = await this.guild.invitePlayer(data.guild_id, character[0].id);

      if (!affectedRows)
        return ctx.response.status(404).send({ message: "There was an error inviting the player to the guild. Contact the administrator."});

      return ctx.response.status(200).send({ status: 200, result: "Invitation sent successfully!" });
    } catch(err) {
      console.log('Error sendInvitation: ', err);
      return ctx.response.status(400).send({ message: err })
    }
  }

  public async update(ctx: HttpContextContract) {
    try {
      const data = await ctx.request.validate(UpdateValidator);

      const character: any = await this.characterView.getByName(data.character_invitation) as Player[];

      const online = await this.characterView.isOnline(character[0].id);
    
      if (online.length)
        return ctx.response.status(404).send({ message: 'The character cannot be online.' });
      
      const account = ctx.auth.user;

      if (!account || account && account.id !== character[0].account_id)
        return ctx.response.status(404).send({ message: "The character does not belong to you."});

      character[0].rank_id = await this.characterView.getRankId(character[0].id);

      if (character[0].rank_id.length && character[0].rank_id[0].rank_id > 0)
        return ctx.response.status(404).send({ message: "You are already in a guild."});
      
      const alreadyInvited = await this.guild.alreadyInvited(data.guild_id, character[0].id);
      
      if (!alreadyInvited)
        return ctx.response.status(404).send({ message: "You are not invited to this guild." });
      
      const affectedRows = await this.guild.acceptInvite(data.guild_id, character[0].id);

      if (!affectedRows)
        return ctx.response.status(404).send({ message: "An error occurred while removing the player's invite to the guild. Contact the administrator."});

      return ctx.response.status(200).send({ status: 200, result: "Invitation successfully accepted!" });
    } catch(err) {
      console.log('Error cancelInvitation: ', err);
      return ctx.response.status(400).send({ message: err })
    }
  }

  public async delete(ctx: HttpContextContract) {
    try {
      const data = await ctx.request.validate(DeleteValidator);

      const account = ctx.auth.user;

      if (!account) {
        return ctx.response.status(404).send({ message: "Invalid account."});
      }

      const isLeaderOrVice = await this.guild.isLeaderOrVice(account.id, data.guild_id);

      if (!isLeaderOrVice)
        return ctx.response.status(404).send({ message: "You are not a leader or vice leader of guild."});
      
      const character = await this.characterView.getByName(data.character_invitation) as Player[];
      
      const alreadyInvited = await this.guild.alreadyInvited(data.guild_id, character[0].id);
      
      if (!alreadyInvited)
        return ctx.response.status(404).send({ message: "The player has not been invited to your guild."});
      
      const affectedRows = await this.guild.removeInvite(data.guild_id, character[0].id);

      if (!affectedRows)
        return ctx.response.status(404).send({ message: "An error occurred while removing the player's invite to the guild. Contact the administrator."});

      return ctx.response.status(200).send({ status: 200, result: "Invitation canceled successfully!" });
    } catch(err) {
      console.log('Error cancelInvitation: ', err);
      return ctx.response.status(400).send({ message: err })
    }
  }
}
