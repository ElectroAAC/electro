import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'

export default class AccountController {
  public async show(ctx: HttpContextContract) {
    const account = ctx.auth.user!;
    return account;
  }
}