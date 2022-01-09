import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import { schema, rules } from '@ioc:Adonis/Core/Validator'

export default class StoreValidator {
  constructor(private ctx: HttpContextContract) {}

  public schema = schema.create({
    email: schema.string({ trim: true }, [
      rules.email(),
      rules.exists({ table: 'accounts', column: 'email' })
    ]),
    redirectUrl: schema.string({ trim: true })
  })

  public cacheKey = this.ctx.routeKey

  public messages = {}
}