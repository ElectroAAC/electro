import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import { CharacterView } from 'App/Services';

export default class VocationsController {
  public characterView: CharacterView = new CharacterView();

  public async show(ctx: HttpContextContract) {
    try {
      await ctx.bouncer.with('DashboardPolicy').authorize('admin');

      const vocations = await this.characterView.getTotalVocations();

      return ctx.response.status(200).send({ result: vocations});
    } catch(err) {
      console.log('Error getTopPremiumPoints Query: ', err);
      return ctx.response.status(400).send({ message: 'An error occurred, check the api console.'})
    }
  }
}
