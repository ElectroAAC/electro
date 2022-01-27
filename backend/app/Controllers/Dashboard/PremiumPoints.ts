import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import Database from '@ioc:Adonis/Lucid/Database'

export default class PremiumPointsController {
  public async show({ response, bouncer }: HttpContextContract) {
    try {
      await bouncer.with('DashboardPolicy').authorize('viewList');

      const accounts = await Database
        .from('accounts')
        .select('premium_points', 'name')
        .orderBy('premium_points', 'desc')
        .limit(10);

      return response.status(200).send({ result: accounts});
    } catch(err) {
      console.log('Error getTopPremiumPoints Query: ', err);
      return response.status(400).send({ message: 'An error occurred, check the api console.'})
    }
  }

  public async edit({}: HttpContextContract) {}

  public async update({}: HttpContextContract) {}

  public async destroy({}: HttpContextContract) {}
}
