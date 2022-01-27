import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import { DeleteValidator, StoreValidator, UpdateValidator } from 'App/Validators/Account/Character'
import { Vocations } from 'Contracts/enums/Vocations'
import { Account } from 'App/Models'
import Database from '@ioc:Adonis/Lucid/Database'
import Env from '@ioc:Adonis/Core/Env'
import encrypt from 'js-sha1'

export default class CharactersAccount {
  
  private async getCharacters(account_id: number) {
    return await Database
      .from('players')
      .select('players.id', 'players.level', 'players.name', 'players.vocation')
      .where('players.account_id', account_id)
      .orderBy('players.experience', 'desc');
  }

  public async store({ request, response, auth }: HttpContextContract) {
    try {
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
        name: data.name.charAt(0).toUpperCase() + data.name.slice(1).toLowerCase(),
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

      return response.status(200).send({ status: 200, message: 'Character created successfully!'});
    } catch (err) {
      console.log('Error getPlayersAccount Query: ', err);
      return response.badRequest(err.messages);
    }
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

  public async update({ request, response, auth }: HttpContextContract) {
    try {
      if (!Env.get('CHANGE_NAME')) {
        return response.status(404).send({ message: 'Change character name is disabled.' });
      }

      const data = await request.validate(UpdateValidator);

      const account = auth.user;

      if (!account || !account.id) {
        return response.unauthorized();
      }

      if (account.premium_points < Env.get('POINTS_TO_CHANGE_NAME')) {
        return response.status(404).send({ message: "You don't have the points needed to change the name. It is necessary: " + Env.get('POINTS_TO_CHANGE_NAME') + " points." });
      }

      const character = await Database.from('players').select('name', 'online').where('id', '=', data.character_id).andWhere('account_id', '=', account.id);

      if (!character.length)
      {
        return response.status(404).send({ message: 'The character does not belong to your account.' });
      }

      if (character[0].online === 1)
      {
        return response.status(404).send({ message: 'The character cannot be online.' });
      }
      
      const updateCharacter = await Database.from('players').where('id', '=', data.character_id).update({ name: data.new_name });
      
      await Database.from('accounts').where('id', '=', account.id).update({ premium_points: account.premium_points - Env.get('POINTS_TO_CHANGE_NAME')});
      
      if (!updateCharacter) {
        return response.status(404).send({ message: "Error. Can't change character name. Probably problem with database. Please try again later or contact with admin." });
      }

      return response.status(200).send({ status: 200, message: "The character " + character[0].name + " name has been changed to " + data.new_name + "." });
    } catch(err) {
      console.log('Error Change Character Name Query: ', err);
      return response.badRequest(err.messages);
    }
  }

  public async destroy({ request, response, auth }: HttpContextContract) {
    try {
      const data = await request.validate(DeleteValidator);

      const account = auth.user;

      if (!account || !account.id) 
        return response.unauthorized();

      const verifyPassword = await Account
        .query()
        .where('name', account.name)
        .where('password', encrypt(data.password))
        .firstOrFail();
      
      if (!verifyPassword)
       return response.status(404).send({ message: 'Wrong password.' });
      
      const character = await Database
        .from('players')
        .select('name', 'deleted', 'online')
        .where('id', '=', data.character_id)
        .andWhere('account_id', '=', account.id);

      if (!character.length)
        return response.status(404).send({ message: 'The character does not belong to your account.' });
      
      if (character[0].online === 1)
        return response.status(404).send({ message: 'You cannot delete a character that is online.' });
      
      if (character[0].deleted === 1)
        return response.status(404).send({ message: 'This character is already deleted.' });
      
      const house = await Database.from('houses').select('id').where('owner', '=', data.character_id);

      if (house.length) 
        return response.status(404).send({ message: 'You cannot delete a character that has a house.' });
      
      const updateCharacter = await Database.from('players').where('id', '=', data.character_id).update({ deleted: 1 });

      if (!updateCharacter)
        return response.status(404).send({ message: "Error. Unable to delete character. Probably problem with database. Please try again later or contact with admin." });
      
      return response.status(200).send({ status: 200, message: "The character " + character[0].name + " has been deleted." });
    } catch (err) {

    }
  }
}
