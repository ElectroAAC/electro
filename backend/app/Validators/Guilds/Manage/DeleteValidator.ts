import { schema, rules } from '@ioc:Adonis/Core/Validator'
import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'

export default class DeleteValidator {
  constructor(protected ctx: HttpContextContract) {}

  public schema = schema.create({
    guild_id: schema.number([ rules.required(), rules.exists({ table: 'guilds', column: 'id'})]),
  })

  public messages = {
    required: 'The {{ field }} is required to change motd a guild',
  }
}
