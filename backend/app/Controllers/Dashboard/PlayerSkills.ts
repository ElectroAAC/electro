import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext';
import { UpdateValidator } from 'App/Validators/Dashboard/CharacterSkills';
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
      console.log('Error findCharacterSkills: ', err);
      return ctx.response.status(400).send({ message: 'An error occurred, check the api console.'})
    }
  }

  public async update(ctx: HttpContextContract) {
    try {
      await ctx.bouncer.with('DashboardPolicy').authorize('viewList');

      const data = await ctx.request.validate(UpdateValidator);

      const updateSkills = await this.playerSkillsService.update(data);

      if (updateSkills !== "Skills successfully updated.")
        return ctx.response.status(404).send({ message: updateSkills });

      return ctx.response.status(200).send({ status: 200, message: updateSkills });
    } catch (err) {
      console.log('Error updateCharacterSkills: ', err);
      return ctx.response.status(400).send({ message: 'An error occurred, check the api console.'})
    }
  }
}
