import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext';
import { UpdateValidator } from 'App/Validators/Dashboard/Characters';
import { CharacterView, CharacterRepository } from 'App/Services';

export default class PlayersController {
  public characterView: CharacterView = new CharacterView();
  public characterRepository: CharacterRepository = new CharacterRepository();

  public async index(ctx: HttpContextContract) {
    try {
      await ctx.bouncer.with('DashboardPolicy').authorize('viewList');

      const accounts = await this.characterView.getTotalCharacters();

      return ctx.response.status(200).send({ result: accounts });
    } 
    catch(err) {
      console.log('Error getTotalPlayers Query: ', err);
      return ctx.response.status(400).send({ message: 'An error occurred, check the api console.'})
    }
  }

  public async show(ctx: HttpContextContract) {
    try {
      await ctx.bouncer.with('DashboardPolicy').authorize('viewList');

      const character = await this.characterView.getByName(ctx.request.param('name'));
       
      if (!character.length) {
        return ctx.response.status(404).send({ message: "Character not found!" });
      }

      return ctx.response.status(200).send({ status: 200, result: character[0] });
    } 
    catch(err) {
      console.log('Error findCharacter Query: ', err);
      return ctx.response.status(400).send({ message: 'An error occurred, check the api console.'})
    }
  }

  public async update(ctx: HttpContextContract) {
    try {
      await ctx.bouncer.with('DashboardPolicy').authorize('viewList');

      const data = await ctx.request.validate(UpdateValidator);
      
      const character = await this.characterRepository.update(data);
      
      if (character !== "Character successfully updated.")
        return ctx.response.status(404).send({ message: character });

      return ctx.response.status(200).send({ status: 200, message: character });
    } 
    catch (err) {
      console.log('Error updateAccount Query: ', err);
      return ctx.response.status(400).send({ message: err})
    }
  }
}
