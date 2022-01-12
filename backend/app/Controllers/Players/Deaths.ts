import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import Database from '@ioc:Adonis/Lucid/Database'

export default class PlayerDeathsController {
  public async show({ request, response }: HttpContextContract) {
    try {
      const deaths = await Database
        .from('player_deaths')
        .select('id', 'date', 'level')
        .where('player_id', request.param('id'))
        .orderBy('date', 'desc')
        .limit(10);
      return response.status(200).send({ result: deaths});

    } catch(err) {
      console.log('Error getPlayerDeaths Query: ', err);
      return response.status(400).send({ message: 'An error occurred, check the api console.'})
    }
  }
}
