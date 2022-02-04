import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import { StorageService } from 'App/Services'

export default class PlayerStorageController {
  public storageService: StorageService = new StorageService();

  public async show({ request, response }: HttpContextContract) {
    try {
      const playerStorage = await this.storageService.getCharacterStorage(request.param('id'), request.param('key'));

      return response.status(200).send({ result: playerStorage});
    } catch(err) {
      console.log('Error getPlayerStorage Query: ', err);
      return response.status(400).send({ message: 'An error occurred, check the api console.'})
    }
  }
}
