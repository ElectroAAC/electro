import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'

export default class AccountController {
  public async show({ auth }: HttpContextContract) {
    const account = auth.user!;

    return account;
  }
}