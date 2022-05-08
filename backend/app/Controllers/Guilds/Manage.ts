import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import { 
  LeadershipValidator,
  DeleteValidator,
  DescriptionValidator,
  MotdValidator,
  RankValidator 
} from 'App/Validators/Guilds/Manage'

import {
  Character,
  CharacterView,
  Guild,
  GuildRepository
} from 'App/Services'

import { Player } from 'App/Models';

export default class ManageController {
  public character: Character = new Character();
  public characterView: CharacterView = new CharacterView();
  public guild: Guild = new Guild();
  public guildRepository: GuildRepository = new GuildRepository();

  public async passLeadership(ctx: HttpContextContract) {
    try {
      const data = await ctx.request.validate(LeadershipValidator);
      
      const account = ctx.auth.user;

      if (!account) {
        return ctx.response.status(404).send({ message: "Invalid account."});
      }

      const isLeader = await this.guild.isOwner(account.id, data.guild_id);
      let isMember = false;

      if (!isLeader)
        return ctx.response.status(404).send({ message: "You are not the guild owner." });

      const online = await this.characterView.isOnline(data.new_leader_id);

      if (online.length) {
        return ctx.response.status(404).send({ message: "The character is online." });
      }

      const guildMembers = await this.guild.getGuildMembers(data.guild_id) as Player[];

      for (let member of guildMembers) {
        if (member.id === data.new_leader_id) {
          isMember = true;
        }
      }
      
      if (!isMember) {
        return ctx.response.status(404).send({ message: "The player is not a member of the guild."});
      }
      
      const affectedRows = await this.guild.passLeadership(data.guild_id, data.new_leader_id);

      if (!affectedRows)
        return ctx.response.status(404).send({ message: "An error occurred while passing guild leadership. Contact the administrator."});

      return ctx.response.status(200).send({ status: 200, result: "Leadership transferred successfully!" });
    } catch(err) {
      console.log('Error getGuilds: ', err);
      return ctx.response.status(400).send({ message: err })
    }
  }

  public async changeMotd(ctx: HttpContextContract) {
    try {
      const data = await ctx.request.validate(MotdValidator);

      const account = ctx.auth.user;

      if (!account) {
        return ctx.response.status(404).send({ message: "Invalid account."});
      }

      const isLeader = await this.guild.isLeader(account.id, data.guild_id);

      if (!isLeader)
        return ctx.response.status(404).send({ message: "You cannot manage a guild that is not yours." });

      const affectedRows = await this.guild.updateMotd(data.guild_id, data.motd);

      if (!affectedRows)
        return ctx.response.status(404).send({ message: "There was an error updating the guild. Contact the administrator."});

      return ctx.response.status(200).send({ status: 200, result: "Guild MOTD successfully updated!" });
    } catch(err) {
      console.log('Error getGuilds: ', err);
      return ctx.response.status(400).send({ message: 'An error occurred, check the api console.'})
    }
  }

  public async changeDescription(ctx: HttpContextContract) {
    try {
      const data = await ctx.request.validate(DescriptionValidator);

      const account = ctx.auth.user;

      if (!account) {
        return ctx.response.status(404).send({ message: "Invalid account."});
      }

      const isLeader = await this.guild.isLeader(account.id, data.guild_id);

      if (!isLeader)
        return ctx.response.status(404).send({ message: "You cannot manage a guild that is not yours." });

      const affectedRows = await this.guild.updateDescription(data.guild_id, data.description);

      if (!affectedRows)
        return ctx.response.status(404).send({ message: "There was an error updating the guild. Contact the administrator."});

      return ctx.response.status(200).send({ status: 200, result: "Guild Description successfully updated!" });
    } catch(err) {
      console.log('Error getGuilds: ', err);
      return ctx.response.status(400).send({ message: 'An error occurred, check the api console.'})
    }
  }

  public async changeRank(ctx: HttpContextContract) {
    try {
      const data = await ctx.request.validate(RankValidator);

      const account = ctx.auth.user;

      if (!account) {
        return ctx.response.status(404).send({ message: "Invalid account."});
      }

      const online = await this.characterView.isOnline(data.character_id);

      if (online.length) 
        return ctx.response.status(404).send({ message: "The character needs to be offline." });
      
      const isLeader = await this.guild.isLeader(account.id, data.guild_id);

      if (!isLeader)
        return ctx.response.status(404).send({ message: "You cannot manage a guild that is not yours." });

      const ranks = await this.guild.getGuildRanks(data.guild_id) as { id: number, level: number }[];

      const rank_id: any = await this.characterView.getRankId(data.character_id) as Player[];

      const rank = ranks.find((rank) => rank.id === rank_id[0].rank_id);

      if (rank?.level === 3 && rank?.level !== data.rank_level) {
        const isOwner = await this.guild.isOwner(account.id, data.guild_id);
        if (!isOwner) {
          return ctx.response.status(404).send({ message: "You must be a guild owner to remove a member's Leader role." });
        }
      }

      const newRank = ranks.some((rank) => rank.level === data.rank_level) 
        ? ranks.find((rank) => rank.level === data.rank_level) 
        : null;
      
      if (!newRank)
        return ctx.response.status(404).send({ message: "The new position does not exist." });

      const affectedRows = await this.character.updateRankId(data.character_id, newRank.id);

      if (!affectedRows)
        return ctx.response.status(404).send({ message: "There was an error updating the rank from player. Contact the administrator."});

      return ctx.response.status(200).send({ status: 200, result: "New role successfully assigned.!" });
    } catch(err) {
      console.log('Error changeRank: ', err);
      return ctx.response.status(400).send({ message: err });
    }
  }

  public async delete(ctx: HttpContextContract) {
    try {
      const data = await ctx.request.validate(DeleteValidator);

      const account = ctx.auth.user;

      if (!account) {
        return ctx.response.status(404).send({ message: "Invalid account."});
      }

      const isLeader = await this.guild.isLeader(account.id, data.guild_id);

      if (!isLeader)
        return ctx.response.status(404).send({ message: "You cannot manage a guild that is not yours." });

      const affectedRows = await this.guildRepository.delete(data.guild_id);

      if (!affectedRows)
        return ctx.response.status(404).send({ message: "There was an error deleting the guild. Contact the administrator."});

      return ctx.response.status(200).send({ status: 200, result: "Guild successfully deleted!" });
    } catch(err) {
      console.log('Error getGuilds: ', err);
      return ctx.response.status(400).send({ message: 'An error occurred, check the api console.'})
    }
  }
}
