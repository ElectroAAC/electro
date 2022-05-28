import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import { CharacterView, StorageService } from 'App/Services'

export default class PlayerStorageController {
  public characterView: CharacterView = new CharacterView();
  public storageService: StorageService = new StorageService();

  public async characterStorages({ request, response }: HttpContextContract) {
    try {
      const storages = await this.characterView.getStorages(request.param('id'));

      return response.status(200).send({ result: storages });
    } catch(err) {
      console.log('Error getCharacterStorages Query: ', err);
      return response.status(400).send({ message: 'An error occurred, check the api console.'})
    }
  }

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
