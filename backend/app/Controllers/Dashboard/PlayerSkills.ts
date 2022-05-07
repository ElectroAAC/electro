import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext';
import { UpdateValidator } from 'App/Validators/Dashboard/CharacterSkills';
import { Skill, SkillView } from 'App/Services';

export default class PlayersController {
  public skill: Skill = new Skill();
  public skillView: SkillView = new SkillView();

  public async show(ctx: HttpContextContract) {
    try {
      await ctx.bouncer.with('DashboardPolicy').authorize('admin');

      const skills = await this.skillView.getCharacterSkills(ctx.request.param('id'));
       
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
      await ctx.bouncer.with('DashboardPolicy').authorize('admin');

      const data = await ctx.request.validate(UpdateValidator);

      for(let i = 0; i < 7; i++) {
        await this.skill.updateCharacterSkill(data.id, data.skills[i]);
      }

      return ctx.response.status(200).send({ status: 200, message: "Skills successfully updated." });
    } catch (err) {
      console.log('Error updateCharacterSkills: ', err);
      return ctx.response.status(400).send({ message: 'An error occurred, check the api console.'})
    }
  }
}
