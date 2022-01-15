import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import { StoreValidator } from 'App/Validators/Auth'
import { Account } from 'App/Models'
import encrypt from 'js-sha1';

export default class AuthController {
  public async store({ request, auth }: HttpContextContract) {
    const { name, password, rememberMe } = await request.validate(StoreValidator);

    const encryptedPassword = encrypt(password);
    
    const user = await Account
      .query()
      .where('name', name)
      .where('password', encryptedPassword)
      .firstOrFail();

    if (!user)
      return "";

    const token = await auth.use('api').generate(user, {
      expiresIn: rememberMe ? '7 days' : '30mins'
    });

    return token;
  }

  public async destroy({ auth }: HttpContextContract) {
    await auth.logout();
  }
}
