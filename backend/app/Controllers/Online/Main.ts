import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import Database from '@ioc:Adonis/Lucid/Database'

export default class OnlineController {
  public async show({ response }: HttpContextContract) {
    try {
      const playersOnline = await Database
        .from('players')
        .innerJoin('accounts', 'accounts.id', 'players.account_id')
        .select('accounts.country', 'players.skull', 'players.skulltime', 'players.name', 'players.level', 'players.vocation')
        .where('players.online', '>', '0')
        .orderBy('experience', 'desc');
      
      const serverRecord = await Database.from('server_record').select('record', 'timestamp').where('world_id', '=', 0).orderBy('record', 'desc').limit(1)
      
      const result = {
        serverRecord,
        playersOnline
      };

      return response.status(200).send({ status: 200, result});
    } catch(err) {
      console.log('Error getPlayersOnline Query: ', err);
      return response.status(400).send({ error: 'An error occurred, check the api console.'});
    }
  }
}
