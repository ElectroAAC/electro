import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import Database from '@ioc:Adonis/Lucid/Database'
import { UpdateValidator } from 'App/Validators/Dashboard/Accounts'

export default class AccountsController {
  public async index({ response, bouncer }: HttpContextContract) {
    try {
      await bouncer.with('DashboardPolicy').authorize('viewList');
      
      const accounts = await Database
        .from('accounts')
        .count('* as total');

      return response.status(200).send({ result: accounts});
    } catch(err) {
      console.log('Error getTotalAccounts Query: ', err);
      return response.status(400).send({ status: 200, message: 'An error occurred, check the api console.'})
    }
  }

  public async show({ request, response, bouncer }: HttpContextContract) {
    try {
      await bouncer.with('DashboardPolicy').authorize('viewList');

      const account = await Database
        .from('accounts')
        .select('id', 'name', 'premdays', 'email', 'group_id', 'web_flags', 'premium_points', 'key')
        .where('name', '=', request.param('name'));
       
      if (!account.length) {
        return response.status(404).send({ message: "Account not found!"});
      }

      const characters = await Database
        .from('players')
        .select('players.id', 'players.level', 'players.name', 'players.vocation')
        .where('players.account_id', account[0].id)
        .orderBy('players.experience', 'desc');

      return response.status(200).send({ status: 200, result: { account, characters }});
    } catch(err) {
      console.log('Error findAccount Query: ', err);
      return response.status(400).send({ message: 'An error occurred, check the api console.'})
    }
  }

  public async update({ request, response, bouncer}: HttpContextContract) {
    try {
      await bouncer.with('DashboardPolicy').authorize('viewList');
      const data = await request.validate(UpdateValidator);
      
      const account = await Database
        .from('accounts')
        .select('id')
        .where('name', '=', data.name)
        .andWhere('id', '<>', data.id);
      
      if (account.length) {
        return response.status(404).send({ message: "Error. The username is already used."});
      }
      
      const affectedRows = await Database.from('accounts')
        .where('id', '=', data.id)
        .update(data);
      
      if (!affectedRows) {
        return response.status(404).send({ message: "Account not found."});
      }
      
      return response.status(200).send({ status: 200, message: "Account successfully updated." });
    } catch (err) {
      console.log('Error updateAccount Query: ', err);
      return response.status(400).send({ message: err})
    }
  }

  public async destroy({}: HttpContextContract) {}
}
