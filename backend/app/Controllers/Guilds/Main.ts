import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import Database from '@ioc:Adonis/Lucid/Database'

export default class GuildsController {
  public async show({ request, response }: HttpContextContract) {
    try {
      const guilds = await Database
        .from('guilds')
        .select('id', 'name', 'motd', 'logo_name')
        .paginate(request.param('page', 1), request.param('limit'));

      return response.status(200).send({ status: 200, result: guilds });
    } catch(err) {
      console.log('Error getGuilds Query: ', err);
      return response.status(400).send({ message: 'An error occurred, check the api console.'})
    }
  }

  public async edit({}: HttpContextContract) {}

  public async update({}: HttpContextContract) {}

  public async destroy({}: HttpContextContract) {}
}
