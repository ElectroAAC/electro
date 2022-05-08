import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import { StoreValidator } from 'App/Validators/Account/Character'
import { Vocations } from 'Contracts/enums/Vocations'
import { Item, Player } from 'App/Models'
import Env from '@ioc:Adonis/Core/Env'

import {
  Character,
  CharacterView,
  CharacterRepository
} from 'App/Services'

export default class CharactersAccount {
  public character: Character = new Character();
  public characterView: CharacterView = new CharacterView();
  public characterRepository: CharacterRepository = new CharacterRepository();

  public async store(ctx: HttpContextContract) {
    try {
      const data = await ctx.request.validate(StoreValidator);

      const account = ctx.auth.user;

      if (!account || !account.id) {
        return ctx.response.unauthorized();
      }

      const characters = await this.characterView.getByAccount(account.id);
      
      if (characters.length >= Env.get('CHARACTERS_PER_ACCOUNT')) {
        return ctx.response.status(404).send({ message: 'You have too many characters on your account ' + characters.length + '/' + Env.get('CHARACTERS_PER_ACCOUNT')});
      }

      const vocation = Vocations.find((vocation) => vocation.vocation_id === data.vocation);

      if (!vocation || !vocation.vocation_id) {
        return ctx.response.status(404).send({ message: 'Vocation invalid'});
      }

      const characterCopy: Player[] = await this.characterView.getByName(vocation.name) as Player[];
      
      if (!characterCopy.length) {
        console.log("Error find Sample Character: Edit file Vocations in contracts/enums/Vocations and set valid characters to copy names. Name Character to copy: " + vocation.name + " doesn\'t exist.");
        return ctx.response.status(404).send({ message: "Wrong characters configuration. Try again or contact with admin."});
      }

      const newPlayer = {...characterCopy[0],
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
      };

      const result = await this.characterRepository.create(newPlayer);

      const player: Player[] = await this.characterView.getById(result[0]) as Player[];

      const items_to_copy: Item[] = await this.characterView.getItems(characterCopy[0].id) as Item[];

      for(let item of items_to_copy) {
        await this.character.insertItems(player[0].id, item.pid, item.sid, item.itemtype, item.count, item.attributes);
      };

      return ctx.response.status(200).send({ status: 200, message: 'Character created successfully!'});
    } catch (err) {
      console.log('Error getPlayersAccount Query: ', err);
      return ctx.response.badRequest(err.messages);
    }
  }

  public async show(ctx: HttpContextContract) {
    try {
      const characters = await this.characterView.getByAccount(ctx.request.param('id'));

      return ctx.response.status(200).send({ result: characters});
    } catch(err) {
      console.log('Error getPlayersAccount Query: ', err);
      return ctx.response.status(400).send({ message: 'An error occurred, check the api console.'})
    }
  }
}
