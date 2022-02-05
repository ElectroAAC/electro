import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import { AccountView } from 'App/Services';

export default class PremiumPointsController {
  public accountView: AccountView = new AccountView();

  public async show(ctx: HttpContextContract) {
    try {
      await ctx.bouncer.with('DashboardPolicy').authorize('viewList');

      const accounts = await this.accountView.getTopPremiumPoints();

      return ctx.response.status(200).send({ result: accounts});
    } catch(err) {
      console.log('Error getTopPremiumPoints Query: ', err);
      return ctx.response.status(400).send({ message: 'An error occurred, check the api console.'})
    }
  }
}
