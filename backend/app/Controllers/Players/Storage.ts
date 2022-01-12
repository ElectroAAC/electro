import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import Database from '@ioc:Adonis/Lucid/Database'

export default class PlayerStorageController {
  public async show({ request, response }: HttpContextContract) {
    try {
      console.log(request.params());
      
      const playerStorage = await Database
        .from('player_storage')
        .select('player_storage.key', 'player_storage.value')
        .where('player_storage.player_id', request.param('id'))
        .andWhere('player_storage.key', request.param('key'));

      return response.status(200).send({ result: playerStorage});

    } catch(err) {
      return response.status(400).send({ message: 'An error occurred, check the api console.'})
    }
  }
}
