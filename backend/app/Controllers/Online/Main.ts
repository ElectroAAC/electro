import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import Database from '@ioc:Adonis/Lucid/Database'

export default class OnlineController {
  public async show({ response }: HttpContextContract) {
    try {
      const playersOnline = await Database
        .from('players')
        .innerJoin('accounts', 'accounts.id', 'players.account_id')
        .select('accounts.country', 'players.name', 'players.level', 'players.vocation')
        .where('players.online', '>', '0')
        .orderBy('experience', 'desc');

      return response.status(200).send({ result: playersOnline});
    } catch(err) {
      console.log('Error getPlayersOnline Query: ', err);
      return response.status(400).send({ error: 'An error occurred, check the api console.'});
    }
  }
}
