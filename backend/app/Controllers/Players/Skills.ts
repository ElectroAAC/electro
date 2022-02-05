import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import { SkillView } from 'App/Services'

export default class PlayerSkillController {
  public skillView: SkillView = new SkillView();

  public async show(ctx: HttpContextContract) {
    try {
      const playerSkills = await this.skillView.getCharacterSkills(ctx.request.param('id'));

      return ctx.response.status(200).send({ result: playerSkills});
    } catch(err) {
      console.log('Error getPlayerSkills Query: ', err);
      return ctx.response.status(400).send({ message: 'An error occurred, check the api console.'})
    }
  }
}
