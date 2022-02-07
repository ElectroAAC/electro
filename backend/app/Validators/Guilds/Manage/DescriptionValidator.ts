import { schema, rules } from '@ioc:Adonis/Core/Validator'
import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'

export default class DescriptionValidator {
  constructor(protected ctx: HttpContextContract) {}

  public schema = schema.create({
    account_id: schema.number([rules.exists({ table: 'accounts', column: 'id'})]),
    guild_id: schema.number([rules.exists({ table: 'guilds', column: 'id'})]),
    description: schema.string({ escape: true }, [
      rules.required()
    ]),
  })

  public messages = {
    required: 'The {{ field }} is required to change motd a guild',
  }
}
