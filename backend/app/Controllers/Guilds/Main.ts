import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import { StoreValidator } from 'App/Validators/Guilds/Register'
import { LeaveValidator } from 'App/Validators/Guilds/Main'
import { 
  Character,
  CharacterView, 
  GuildRepository,
  GuildView,
  GuildRanksRepository,
  GuildMembershipRepository
} from 'App/Services'

import { Player } from 'App/Models';
import { GuildRanks } from 'Contracts/enums/GuildRanks'

interface Guild {
  id: number,
  rank_id: number,
  owner_id: number
}

interface Rank {
  id: number,
  level: number
}
export default class GuildsController {
  public character: Character = new Character();
  public characterView: CharacterView = new CharacterView();
  public guildRepository: GuildRepository = new GuildRepository();
  public guildView: GuildView = new GuildView();
  public guildRanksRepository: GuildRanksRepository = new GuildRanksRepository();
  public guildMembershipRepository: GuildMembershipRepository = new GuildMembershipRepository();

  public async index(ctx: HttpContextContract) {
    try {
      const guilds = await this.guildView.getGuilds(ctx.request.param('page'), ctx.request.param('limit'));

      return ctx.response.status(200).send({ status: 200, result: guilds });
    } catch(err) {
      console.log('Error getGuilds: ', err);
      return ctx.response.status(400).send({ message: 'An error occurred, check the api console.'})
    }
  }

  public async create(ctx: HttpContextContract) {
    
    const data = await ctx.request.validate(StoreValidator);
    
    const account = ctx.auth.user;

    if (!account || !account.id) {
      return ctx.response.unauthorized();
    }

    const character = await this.characterView.findByIdAndAccount(data.character_id, account.id) as Player[];

    if (!character.length)
    {
      return ctx.response.status(404).send({ message: 'The character does not belong to your account.' });
    }

    const online = await this.characterView.isOnline(character[0].id);
    const rank_id = await this.characterView.getRankId(character[0].id);

    if (online.length)
      return ctx.response.status(404).send({ message: 'The character cannot be online.' });

    if (rank_id.length)
    {
      return ctx.response.status(404).send({ message: 'Your character already has a guild.' });
    }

    const newGuild = {
      name: data.name,
      ownerid: data.character_id,
      creationdata: 0,
      description: 'New guild. Leader must edit this text',
      motd: '',
      logo_name: ''
    };

    const result = await this.guildRepository.create(newGuild);

    if (!result) {
      return ctx.response.status(404).send({ message: "Error. Can't create guild. Probably problem with database. Please try again later or contact with admin."});
    }
    
    const rankLeaderId = await this.guildRanksRepository.create({
      guild_id: result[0],
      name: 'Leader',
      level: 3
    });

    await this.guildRanksRepository.create({
      guild_id: result[0],
      name: 'Vice-Leader',
      level: 2
    });

    await this.guildRanksRepository.create({
      guild_id: result[0],
      name: 'Member',
      level: 1
    });

    await this.guildMembershipRepository.insert({
      player_id: data.character_id,
      guild_id: result,
      rank_id: rankLeaderId[0]
    });

    return ctx.response.status(200).send({ status: 200, message: 'Guild created successfully!'});
  }

  public async show(ctx: HttpContextContract) {
    try {
      const guild = await this.guildView.getGuildByName(ctx.request.param('name')) as Guild[];

      if (!guild.length) {
        return ctx.response.status(404).send({ message: "Guild not found." });
      }

      const guildRanks = await this.guildView.getGuildRanks(guild[0].id) as Rank[];

      let guild_leader = false;
      let guild_vice = false;
      let level_guild = 0;

      const players_from_account_in_guild: Number[] = [];
      const players_from_account_ids: Number[] = [];

      let invites: Object[] = [];

      if (!guild.length) {
        return ctx.response.status(404).send({ message: "Guild not found." });
      }

      const account = ctx.auth.use('api').user!;

      if (account) {
        const characters_to_account = await this.characterView.getByAccount(account.id) as Player[];
        invites = await this.guildView.getInvitationsByAccount(guild[0].id, account.id);

        for (let character of characters_to_account) {
          players_from_account_ids.push(character.id);
          if (character.rank_id > 0) {
            for (let rank of guildRanks) {
              if (character.rank_id === rank.id) {
                players_from_account_in_guild.push(character.id);

                if (guild[0].owner_id === character.id) {
                  guild_leader = true;
                  guild_vice = true;
                } else if (rank.level > 1) {
                  guild_vice = true;
                  level_guild = rank.level;
                }
              }
            }
          }
        };
      }

      const memberList = await this.guildView.getGuildMembers(guild[0].id);

      const result = {
        info: guild[0],
        guild_leader,
        guild_vice,
        level_guild,
        players_from_account_in_guild,
        players_from_account_ids,
        guild_rank: guildRanks,
        guild_members: memberList,
        invites
      }

      return ctx.response.status(200).send({ status: 200, result });
    } catch(err) {
      console.log('Error getGuild Query: ', err);
      return ctx.response.status(400).send({ message: 'An error occurred, check the api console.'})
    }
  }

  public async leave(ctx: HttpContextContract) {
    try {
      const data = await ctx.request.validate(LeaveValidator);
      
      const account = ctx.auth.user;
  
      if (!account || !account.id) {
        return ctx.response.unauthorized();
      }

      const character = await this.characterView.findByName(data.character) as Player[];

      if (character[0].online !== 0) 
        return ctx.response.status(404).send({ message: "The character needs to be offline." });
      
      if (!account || account && account.id !== character[0].account_id)
        return ctx.response.status(404).send({ message: "The character does not belong to you."});

      const guild = await this.characterView.getGuild(character[0].id) as { guild_id: number }[];

      if (guild[0].guild_id !== data.guild_id)
        return ctx.response.status(404).send({ message: "You do not belong to this guild."});

      const affectedRows = await this.character.updateRankId(character[0].id, 0);

      if (!affectedRows)
        return ctx.response.status(404).send({ message: "There was an error leaving the guild. Contact the administrator."});

      return ctx.response.status(200).send({ status: 200, result: "You have successfully exited the guild!" });
    } catch(err) {
      console.log('Error getGuild Query: ', err);
      return ctx.response.status(400).send({ message: 'An error occurred, check the api console.'})
    }
  }
}
