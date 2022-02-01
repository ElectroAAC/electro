import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import PlayerSkillsService from 'App/Services/Dashboard/PlayerSkillsService';

export default class PlayersController {
  public playerSkillsService: PlayerSkillsService = new PlayerSkillsService();

  public async show(ctx: HttpContextContract) {
    try {
      await ctx.bouncer.with('DashboardPolicy').authorize('viewList');

      const skills = await this.playerSkillsService.find(ctx.request.param('id'));
       
      if (!skills.length) {
        return ctx.response.status(404).send({ message: "Character not found!" });
      }

      return ctx.response.status(200).send({ status: 200, result: skills });
    } catch(err) {
      console.log('Error findCharacterSkills Query: ', err);
      return ctx.response.status(400).send({ message: 'An error occurred, check the api console.'})
    }
  }
}
