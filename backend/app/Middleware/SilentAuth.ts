import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'

export default class SilentAuthMiddleware {
  public async handle({ auth }: HttpContextContract, next: () => Promise<void>) {
    await auth.check()
    await next()
  }
}
