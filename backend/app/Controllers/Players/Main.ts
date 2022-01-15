import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import Database from '@ioc:Adonis/Lucid/Database'

export default class PlayersController {
  public async show({ request, response }: HttpContextContract) {
    try {
      let name = request.param('name');


      name = await name
        .replace(/%20/g, " ")
        .replace(/'+'/g, " ")
        .replace(/'/g, "")
        .replace(/%27/g, "")
        .replace(/-/g, "")
        .replace(/"/g, "")
        .replace(/%22/g, "");

      const player = await Database
        .from('players')
        .select('id', 'name', 'sex', 'vocation', 'level', 'maglevel', 'lastlogin', 'healthmax', 'manamax', 'online', 'created')
        .where('name', name);
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
