import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import Database from '@ioc:Adonis/Lucid/Database'
import { UpdateValidator } from 'App/Validators/Dashboard/Characters';

export default class PlayersController {
  public async index({ response, bouncer }: HttpContextContract) {
    try {
      await bouncer.with('DashboardPolicy').authorize('viewList');

      const accounts = await Database
        .from('players')
        .count('* as total');

      return response.status(200).send({ result: accounts});
    } catch(err) {
      console.log('Error getTotalPlayers Query: ', err);
      return response.status(400).send({ message: 'An error occurred, check the api console.'})
    }
  }

  public async show({ request, response, bouncer }: HttpContextContract) {
    try {
      await bouncer.with('DashboardPolicy').authorize('viewList');

      let name = request.param('name');

      name = await name
        .replace(/%20/g, " ")
        .replace(/'+'/g, " ")
        .replace(/'/g, "")
        .replace(/%27/g, "")
        .replace(/-/g, "")
        .replace(/"/g, "")
        .replace(/%22/g, "");

      const character = await Database
        .from('players')
        .select('*')
        .where('name', '=', name);
       
      if (!character.length) {
        return response.status(404).send({ message: "Character not found!"});
      }

      return response.status(200).send({ status: 200, result: character[0]});
    } catch(err) {
      console.log('Error findCharacter Query: ', err);
      return response.status(400).send({ message: 'An error occurred, check the api console.'})
    }
  }

  public async edit({}: HttpContextContract) {}

  public async update({ request, response, bouncer}: HttpContextContract) {
    try {
      await bouncer.with('DashboardPolicy').authorize('viewList');

      const data = await request.validate(UpdateValidator);
      
      const character = await Database
        .from('players')
        .select('id')
        .where('name', '=', data.name)
        .andWhere('id', '<>', data.id);
      
      if (character.length) {
        return response.status(404).send({ message: "Error. The username is already used."});
      }
      
      const affectedRows = await Database.from('players')
        .where('id', '=', data.id)
        .update(data);
      
      if (!affectedRows) {
        return response.status(404).send({ message: "Character not found."});
      }
      
      return response.status(200).send({ status: 200, message: "Character successfully updated." });
    } catch (err) {
      console.log('Error updateAccount Query: ', err);
      return response.status(400).send({ message: err})
    }
  }

  public async destroy({}: HttpContextContract) {}
}
