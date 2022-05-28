import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import { Creature } from 'App/Services'

export default class PlayerSkillController {
  public creature: Creature = new Creature();

  public async loadXml(ctx: HttpContextContract) {
    try {
      const creature = await this.creature.loadCreatureXml();

      return ctx.response.status(200).send({ data: creature});
    } catch(err) {
      console.log('Error loadCreatureXml: ', err);
      return ctx.response.status(400).send({ message: 'An error occurred, check the api console.'})
    }
  }
}
