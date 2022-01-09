import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import { StoreValidator } from 'App/Validators/Auth'

export default class AuthController {
  public async store({ request, auth }: HttpContextContract) {
    const { name, password } = await request.validate(StoreValidator);

    const token = await auth.attempt(name, password, {
      expiresIn: '1 day'
    });

    return token;
  }

  public async destroy({ auth }: HttpContextContract) {
    await auth.logout();
  }
}
