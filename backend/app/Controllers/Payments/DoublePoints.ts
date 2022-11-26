import Env from '@ioc:Adonis/Core/Env'

export default class DoublePointsController {
  public async show() {
    return Env.get('DOUBLE_POINTS');
  }
}
