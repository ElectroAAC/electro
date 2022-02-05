import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import { StoreValidator } from 'App/Validators/Guilds/Register'
import { CharacterService, GuildService } from 'App/Services'
import { Player } from 'App/Models';

interface Guild {
  id: number,
  rank_id: number
}
export default class GuildsController {
  public characterService: CharacterService = new CharacterService();
  public guildService: GuildService = new GuildService();

  public async index(ctx: HttpContextContract) {
    try {
      const guilds = await this.guildService.getGuilds(ctx.request.param('page'), ctx.request.param('limit'));

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

    const character = await this.characterService.findByIdAndAccount(data.character_id, account.id) as Player[];

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

    const result = await this.guildService.create(newGuild);

    const guild = await this.guildService.getGuildById(result[0]) as Guild[];

    if (!guild.length) {
      return ctx.response.status(404).send({ message: "Error. Can't create guild. Probably problem with database. Please try again later or contact with admin."});
    }
    
    await this.characterService.updateRankId(data.character_id, guild[0].rank_id);

    return ctx.response.status(200).send({ status: 200, message: 'Guild created successfully!'});
  }

  public async show(ctx: HttpContextContract) {
    try {
      const guild = await this.guildService.getGuildByName(ctx.request.param('name')) as Guild[];

      if (!guild.length) {
        return ctx.response.status(404).send({ message: "Guild not found." });
      }
      
      const guildRanks = await this.guildService.getGuildRanks(guild[0].id);

      const memberList = await this.guildService.getGuildMembers(guild[0].id);
      
      const result = {
        info: guild[0],
        guild_rank: guildRanks,
        guild_members: memberList
      }
      
      return ctx.response.status(200).send({ status: 200, result });
    } catch(err) {
      console.log('Error getGuild Query: ', err);
      return ctx.response.status(400).send({ message: 'An error occurred, check the api console.'})
    }
  }

  public async edit({}: HttpContextContract) {}

  public async update({}: HttpContextContract) {}

  public async destroy({}: HttpContextContract) {}
}
