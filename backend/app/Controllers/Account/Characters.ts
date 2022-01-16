import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import { StoreValidator } from 'App/Validators/Account/Character'
import Database from '@ioc:Adonis/Lucid/Database'
import { Vocations } from 'Contracts/enums/Vocations'
import Env from '@ioc:Adonis/Core/Env'

export default class CharactersAccount {
  
  private async getCharacters(account_id: number) {
    return await Database
      .from('players')
      .select('players.id', 'players.level', 'players.name', 'players.vocation')
      .where('players.account_id', account_id)
      .orderBy('players.experience', 'desc');
  }

  public async store({ request, response, auth }: HttpContextContract) {
    const data = await request.validate(StoreValidator);

    const account = auth.user;

    if (!account || !account.id) {
      return response.unauthorized();
    }

    const characters = await this.getCharacters(account.id);
    
    if (characters.length >= Env.get('CHARACTERS_PER_ACCOUNT')) {
      return response.status(404).send({ message: 'You have too many characters on your account ' + characters.length + '/' + Env.get('CHARACTERS_PER_ACCOUNT')});
    }

    const vocation = Vocations.find((vocation) => vocation.vocation_id === data.vocation);

    if (!vocation || !vocation.vocation_id) {
      return response.status(404).send({ message: 'Vocation invalid'});
    }

    const characterCopy = await Database.from('players').select('*').where('name', '=', vocation.name);
    
    if (!characterCopy.length) {
      console.log("Error find Sample Character: Edit file Vocations in contracts/enums/Vocations and set valid characters to copy names. Name Character to copy: " + vocation.name + " doesn\'t exist.");
      return response.status(404).send({ message: "Wrong characters configuration. Try again or contact with admin."});
    }

    const newPlayer = Object.assign(characterCopy[0], {
      id: null,
      name: data.name,
      account_id: account.id,
      vocation: data.vocation,
      town_id: data.town || 0,
      sex: data.sex,
      posx: 0,
      posy: 0,
      posz: 0,
      balance: 0,
      created: 0
    });

    const result = await Database.table('players').returning('id').insert(newPlayer);

    const player = await Database.from('players').select('*').where('id', '=', result[0]);

    if (!player.length) {
      return response.status(404).send({ message: "Error. Can't create character. Probably problem with database. Please try again later or contact with admin."});
    }

    for(let i = 0; i < 7; i++) {
      const skillExists = await Database.from('player_skills').select('skillid').where('player_id', '=', player[0].id).andWhere('skillid', '=', i);

      if (!skillExists.length) {
        await Database.table('player_skills').insert({
          player_id: player[0].id,
          skillid: i,
          value: 10,
          count: 0
        })
      }
    }

    const items_to_copy = await Database.from('player_items').select('*').where('player_id', '=', characterCopy[0].id);

    for(let item of items_to_copy) {
      await Database.table('player_skills').insert({
        player_id: player[0].id,
        pid: item.pid,
        sid: item.sid,
        itemtype: item.itemtype,
        count: item.count,
        attributes: item.attributes
      })
    };

    return response.status(200).send({ message: 'Character created successfully!'});
  }

  public async show({ request, response }: HttpContextContract) {
    try {
      const characters = await this.getCharacters(request.param('id'));

      return response.status(200).send({ result: characters});
    } catch(err) {
      console.log('Error getPlayersAccount Query: ', err);
      return response.status(400).send({ message: 'An error occurred, check the api console.'})
    }
  }
}
