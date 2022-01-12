import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import Database from '@ioc:Adonis/Lucid/Database'

export default class PlayerSkillController {
  public async show({ request, response }: HttpContextContract) {
    try {
      const playerSkills = await Database
        .from('players')
        .join('player_skills', 'players.id', '=', 'player_skills.player_id')
        .select('players.maglevel', 'player_skills.skillid', 'player_skills.value')
        .where('players.id', request.param('id'));
      return response.status(200).send({ result: playerSkills});

    } catch(err) {
      console.log('Error getPlayerSkills Query: ', err);
      return response.status(400).send({ message: 'An error occurred, check the api console.'})
    }
  }
}
