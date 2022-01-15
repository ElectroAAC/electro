import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import Database from '@ioc:Adonis/Lucid/Database'

export default class CharactersAccount {
  public async show({ request, response }: HttpContextContract) {
    try {

      const characters = await Database
        .from('players')
        .select('players.id', 'players.level', 'players.name', 'players.vocation')
        .where('players.account_id', request.param('id'))
        .orderBy('players.experience', 'desc');

      return response.status(200).send({ result: characters});

    } catch(err) {
      console.log('Error getPlayersAccount Query: ', err);
      return response.status(400).send({ message: 'An error occurred, check the api console.'})
    }
  }
}
