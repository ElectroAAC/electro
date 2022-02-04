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
  AccountService,
  CharacterService, 
  HouseService
} from 'App/Services'

import Env from '@ioc:Adonis/Core/Env'

export default class PlayersController {
  public characterService: CharacterService = new CharacterService();
  public accountService: AccountService = new AccountService();
  public houseService: HouseService = new HouseService();

  public async show(ctx: HttpContextContract) {
    try {
      const character = await this.characterService.findByName(ctx.request.param('name'));

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
  
      const character: Player[] = await this.characterService.findByIdAndAccount(data.character_id, account.id) as Player[];
  
      if (!character.length)
        return ctx.response.status(404).send({ message: 'The character does not belong to your account.' });
  
      if (character[0].online === 1)
        return ctx.response.status(404).send({ message: 'The character cannot be online.' });
      
      const updateCharacter = await this.characterService.updateName(data.character_id, data.new_name);
      
      await this.accountService.removePremiumPoints(account.id, Env.get('POINTS_TO_CHANGE_NAME'));
      
      if (!updateCharacter)
        return ctx.response.status(404).send({ message: "Error. Can't change character name. Probably problem with database. Please try again later or contact with admin." });
  
      return ctx.response.status(200).send({ status: 200, message: "The character " + character[0].name + " name has been changed to " + data.new_name + "." });
    } catch (err) {
      console.log('Error changing player name: ', err);
      return ctx.response.status(400).send({ message: 'Character not found!'})
    }
  }

  public async destroy(ctx: HttpContextContract) {
    try {
      const data = await ctx.request.validate(DeleteValidator);

      const account = ctx.auth.user;

      if (!account || !account.id) 
        return ctx.response.unauthorized();

      const verifyPassword = await this.accountService.validatePassword(account.id, data.password);
      
      if (!verifyPassword)
       return ctx.response.status(404).send({ message: 'Wrong password.' });
      
      const character: Player[] = await this.characterService.findByIdAndAccount(data.character_id, account.id) as Player[];

      if (!character.length)
        return ctx.response.status(404).send({ message: 'The character does not belong to your account.' });
      
      if (character[0].online === 1)
        return ctx.response.status(404).send({ message: 'You cannot delete a character that is online.' });
      
      if (character[0].deleted === 1)
        return ctx.response.status(404).send({ message: 'This character is already deleted.' });
      
      const house = await this.houseService.findByOwnerId(data.character_id);

      if (house.length) 
        return ctx.response.status(404).send({ message: 'You cannot delete a character that has a house.' });
      
      const updateCharacter = await this.characterService.delete(data.character_id);

      if (!updateCharacter)
        return ctx.response.status(404).send({ message: "Error. Unable to delete character. Probably problem with database. Please try again later or contact with admin." });
      
      return ctx.response.status(200).send({ status: 200, message: "The character " + character[0].name + " has been deleted." });
    } catch (err) {

    }
  }
}
