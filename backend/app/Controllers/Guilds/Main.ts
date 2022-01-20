import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import { StoreValidator } from 'App/Validators/Guilds/Register'
import Database from '@ioc:Adonis/Lucid/Database'

export default class GuildsController {
  public async index({ request, response }: HttpContextContract) {
    try {
      const guilds = await Database
        .from('guilds')
        .select('id', 'name', 'motd', 'logo_name')
        .paginate(request.param('page', 1), request.param('limit'));

      return response.status(200).send({ status: 200, result: guilds });
    } catch(err) {
      console.log('Error getGuilds Query: ', err);
      return response.status(400).send({ message: 'An error occurred, check the api console.'})
    }
  }

  public async create({ request, response, auth }: HttpContextContract) {
    const data = await request.validate(StoreValidator);
    
    const account = auth.user;

    if (!account || !account.id) {
      return response.unauthorized();
    }

    const character = await Database.from('players').select('name', 'online', 'rank_id').where('id', '=', data.character_id).andWhere('account_id', '=', account.id);

    if (!character.length)
    {
      return response.status(404).send({ message: 'The character does not belong to your account.' });
    }

    if (character[0].online === 1)
    {
      return response.status(404).send({ message: 'The character cannot be online.' });
    }

    if (character[0].rank_id !== 0)
    {
      return response.status(404).send({ message: 'Your character already has a guild.' });
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

    const result = await Database.table('guilds').returning('id').insert(newGuild);

    const guild = await Database.from('guilds').innerJoin('guild_ranks', 'guild_ranks.guild_id', 'guilds.id').select('guild_ranks.id as rank_id').where('guilds.id', '=', result[0]).andWhere('guild_ranks.level', '=', 3);

    if (!guild.length) {
      return response.status(404).send({ message: "Error. Can't create guild. Probably problem with database. Please try again later or contact with admin."});
    }

    await Database.from('players').where('id', '=', data.character_id).update({ rank_id: guild[0].rank_id });

    return response.status(200).send({ status: 200, message: 'Guild created successfully!'});
  }

  public async show({ request, response }: HttpContextContract) {
    try {
      let name = request.param('name');
      
      name = await name
        .replace(/%20/g, " ")
        .replace(/'+'/g, " ")
        .replace(/'/g, "")
        .replace(/%27/g, "")
        .replace(/-/g, "")
        .replace(/"/g, "")
        .replace(/%22/g, "");

      const guild = await Database
        .from('guilds')
        .innerJoin('players', 'players.id', 'guilds.ownerid')
        .select(
          'guilds.id', 
          'guilds.name', 
          'guilds.description', 
          'guilds.ownerid as owner_id', 
          'guilds.creationdata as creation_data',
          'players.name as owner_name',
        )
        .where('guilds.name', '=', name);

      if (!guild.length) {
        return response.status(404).send({ message: "Guild not found." });
      }
      
      const guildRanks = await Database
        .from('guild_ranks')
        .select('id')
        .where('guild_id', '=', guild[0].id);

      const memberList = await Database.from('guilds')
        .innerJoin('guild_ranks', 'guild_ranks.guild_id', '=', 'guilds.id')
        .innerJoin('players', 'players.rank_id', 'guild_ranks.id')
        .select(
          'guild_ranks.level',
          'guild_ranks.name as rank_name',
          'players.id',
          'players.name',
          'players.vocation',
          'players.level as player_level',
          'players.online'
        )
        .where('guilds.id', '=', guild[0].id)
        .orderBy('guild_ranks.level', 'desc');
      
      const result = {
        info: guild[0],
        guild_rank: guildRanks,
        guild_members: memberList
      }
      
      return response.status(200).send({ status: 200, result });
    } catch(err) {
      console.log('Error getGuild Query: ', err);
      return response.status(400).send({ message: 'An error occurred, check the api console.'})
    }
  }

  public async edit({}: HttpContextContract) {}

  public async update({}: HttpContextContract) {}

  public async destroy({}: HttpContextContract) {}
}
