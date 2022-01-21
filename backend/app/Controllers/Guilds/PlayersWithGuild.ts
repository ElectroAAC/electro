import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import Database from '@ioc:Adonis/Lucid/Database'

export default class PlayersWithGuildController {
  public async show({ response, auth }: HttpContextContract) {
    try {
      const account = auth.user;

      if (!account || !account.id) {
        return response.unauthorized();
      }

      const character = await Database
        .from('players')
        .select('id', 'name')
        .where('account_id', '=', account.id)
        .andWhere('rank_id', '=', 0);

      return response.status(200).send({ status: 200, character });
    } catch(err) {
      console.log('Error getPlayersWithGuild Query: ', err);
      return response.status(400).send({ message: 'An error occurred, check the api console.'})
    }
  }
}
