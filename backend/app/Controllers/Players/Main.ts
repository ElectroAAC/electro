import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import Database from '@ioc:Adonis/Lucid/Database'

export default class PlayersController {
  public async show({ request, response }: HttpContextContract) {
    try {
      const player = await Database
        .from('players')
        .select('name', 'sex', 'vocation', 'level', 'maglevel', 'lastlogin', 'healthmax', 'manamax', 'online', 'created')
        .where('id', request.param('id'));
      return response.status(200).send({ result: player});

    } catch(err) {
      console.log('Error getPlayer Query: ', err);
      return response.status(400).send({ message: 'An error occurred, check the api console.'})
    }
  }

  public async edit({}: HttpContextContract) {}

  public async update({}: HttpContextContract) {}

  public async destroy({}: HttpContextContract) {}
}
