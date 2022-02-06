import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import { StoreValidator } from 'App/Validators/Guilds/Register'
import { 
  Character,
  CharacterView, 
  GuildRepository,
  GuildView 
} from 'App/Services'
import { Player } from 'App/Models';

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

    if (character[0].online === 1)
    {
      return ctx.response.status(404).send({ message: 'The character cannot be online.' });
    }

    if (character[0].rank_id !== 0)
    {
      return ctx.response.status(404).send({ message: 'Your character already has a guild.' });
    }

    const newGuild = {
      name: data.name,
      ownerid: data.character_id,
      creationdata: 0,
      checkdata: 0,
      balance: 0,
      invited_to: 0,
      invited_by: 0,
      in_war_with: 0,
      kills: 0,
      show: 0,
      war_time: 0,
      description: 'New guild. Leader must edit this text'
    };

    const result = await this.guildRepository.create(newGuild);

    const guild = await this.guildView.getGuildById(result[0]) as Guild[];

    if (!guild.length) {
      return ctx.response.status(404).send({ message: "Error. Can't create guild. Probably problem with database. Please try again later or contact with admin."});
    }
    
    await this.character.updateRankId(data.character_id, guild[0].rank_id);

    return ctx.response.status(200).send({ status: 200, message: 'Guild created successfully!'});
  }

  public async show(ctx: HttpContextContract) {
    try {
      const guild = await this.guildView.getGuildByName(ctx.request.param('name')) as Guild[];

      const guildRanks = await this.guildView.getGuildRanks(guild[0].id) as Rank[];

      let guild_leader = false;
      let guild_vice = false;
      let level_guild = 0;

      const players_from_account_in_guild: Number[] = [];
      const players_from_account_ids: Number[] = [];

      if (!guild.length) {
        return ctx.response.status(404).send({ message: "Guild not found." });
      }

      const account = ctx.auth.use('api').user!;

      if (account) {
        const characters_to_account = await this.characterView.getByAccount(account.id) as Player[];
        for (let character of characters_to_account) {
          players_from_account_ids.push(character.id);
          if (character.rank_id > 0) {
            for (let rank of guildRanks) {
              if (character.rank_id === rank.id) {
                players_from_account_in_guild.push(character.id);

                if (guild[0].owner_id = character.id) {
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
        guild_members: memberList
      }

      return ctx.response.status(200).send({ status: 200, result });
    } catch(err) {
      console.log('Error getGuild Query: ', err);
      return ctx.response.status(400).send({ message: 'An error occurred, check the api console.'})
    }
  }
}
