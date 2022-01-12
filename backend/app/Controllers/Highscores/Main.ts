import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import Database from '@ioc:Adonis/Lucid/Database'

export default class HighscoresController {

  public async show({ response }: HttpContextContract) {
    try {
      const topRank = await Database
        .from('players')
        .select('id', 'name', 'level', 'vocation', 'experience')
        .orderBy('experience', 'desc')
        .limit(5);
      return response.status(200).send({ result: topRank});
    } catch(err) {
      console.log(err);
      return response.status(400).send({ error: 'An error occurred, check the api console.'});
    }
  }
}
