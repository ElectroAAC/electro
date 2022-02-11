import { schema, rules } from '@ioc:Adonis/Core/Validator'
import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'

export default class MotdValidator {
  constructor(protected ctx: HttpContextContract) {}

  public schema = schema.create({
    guild_id: schema.number([ rules.required(), rules.exists({ table: 'guilds', column: 'id'})]),
    motd: schema.string({ escape: true }, [
      rules.required(),
      rules.maxLength(255),
    ]),
  })

  public messages = {
    required: 'The {{ field }} is required to change motd a guild',
    maxLength: 'Motd is too short. Max length {{ options.maxLength }} letters',
  }
}
