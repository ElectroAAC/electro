import { 
  HttpContextContract 
} from '@ioc:Adonis/Core/HttpContext'

import { 
  DeleteValidator,
  NameValidator 
} from 'App/Validators/Character'

import { 
  Player 
} from 'App/Models'

import { 
  Account,
  Character,
  CharacterRepository,
  CharacterView,
  HouseService
} from 'App/Services'

import Env from '@ioc:Adonis/Core/Env'

export default class PlayersController {
  public character: Character = new Character();
  public characterRepository: CharacterRepository = new CharacterRepository();
  public characterView: CharacterView = new CharacterView();
  public account: Account = new Account();
  public houseService: HouseService = new HouseService();

  public async show(ctx: HttpContextContract) {
    try {
      const character = await this.characterView.findByName(ctx.request.param('name'));

      return ctx.response.status(200).send({ result: character});
    } catch(err) {
      console.log('Error getPlayer: ', err);
      return ctx.response.status(400).send({ message: 'Character not found!'})
    }
  }

  public async changeName(ctx: HttpContextContract) {
    try {
      if (!Env.get('CHANGE_NAME')) {
        return ctx.response.status(404).send({ message: 'Change character name is disabled.' });
      }
  
      const data = await ctx.request.validate(NameValidator);
  
      const account = ctx.auth.user;
  
      if (!account || !account.id) {
        return ctx.response.unauthorized();
      }
  
      if (account.premium_points < Env.get('POINTS_TO_CHANGE_NAME')) {
        return ctx.response.status(404).send({ 
          message: "You don't have the points needed to change the name. It is necessary: " + Env.get('POINTS_TO_CHANGE_NAME') + " points." 
        });
      }
  
      const character: Player[] = await this.characterView.findByIdAndAccount(data.character_id, account.id) as Player[];

      if (!character.length)
        return ctx.response.status(404).send({ message: 'The character does not belong to your account.' });
      
      const online = await this.characterView.isOnline(character[0].id);

      if (online.length)
        return ctx.response.status(404).send({ message: 'The character cannot be online.' });
      
      const updateCharacter = await this.character.updateName(data.character_id, data.new_name);
      
      await this.account.removePremiumPoints(account.id, Env.get('POINTS_TO_CHANGE_NAME'));
      
      if (!updateCharacter)
        return ctx.response.status(404).send({ message: "Error. Can't change character name. Probably problem with database. Please try again later or contact with admin." });
  
      return ctx.response.status(200).send({ status: 200, message: "The character " + character[0].name + " name has been changed to " + data.new_name + "." });
    } catch (err) {
      console.log('Error changing player name: ', err);
      return ctx.response.status(400).send({ message: err })
    }
  }

  public async destroy(ctx: HttpContextContract) {
    try {
      const data = await ctx.request.validate(DeleteValidator);

      const account = ctx.auth.user;

      if (!account || !account.id) 
        return ctx.response.unauthorized();

      const verifyPassword = await this.account.validatePassword(account.id, data.password);

      if (!verifyPassword.length)
       return ctx.response.status(404).send({ message: 'Wrong password.' });
      
      const character: Player[] = await this.characterView.findByIdAndAccount(data.character_id, account.id) as Player[];

      if (!character.length)
        return ctx.response.status(404).send({ message: 'The character does not belong to your account.' });
      
      const online = await this.characterView.isOnline(character[0].id);

      if (online.length)
        return ctx.response.status(404).send({ message: 'You cannot delete a character that is online.' });
      
      if (character[0].deletion === 1)
        return ctx.response.status(404).send({ message: 'This character is already deleted.' });
      
      const house = await this.houseService.findByOwnerId(data.character_id);

      if (house.length) 
        return ctx.response.status(404).send({ message: 'You cannot delete a character that has a house.' });
      
      const updateCharacter = await this.characterRepository.delete(data.character_id);

      if (!updateCharacter)
        return ctx.response.status(404).send({ message: "Error. Unable to delete character. Probably problem with database. Please try again later or contact with admin." });
      
      return ctx.response.status(200).send({ status: 200, message: "The character " + character[0].name + " has been deleted." });
    } catch (err) {
      console.log('Error delete character: ', err);
      return ctx.response.status(400).send({ message: 'Character not found!'})
    }
  }
}
