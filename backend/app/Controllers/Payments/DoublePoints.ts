import Env from '@ioc:Adonis/Core/Env'
import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'

export default class DoublePointsController {
  public async show(ctx: HttpContextContract) {
    return ctx.response.status(200).send({ status: 200, result: Env.get('DOUBLE_POINTS') });
  }
}
