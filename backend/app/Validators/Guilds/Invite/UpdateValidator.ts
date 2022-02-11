import { schema, rules } from '@ioc:Adonis/Core/Validator'
import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'

export default class UpdateValidator {
  constructor(protected ctx: HttpContextContract) {}

  public schema = schema.create({
    account_id: schema.number([ rules.required(), rules.exists({ table: 'accounts', column: 'id'})]),
    guild_id: schema.number([ rules.required(), rules.exists({ table: 'guilds', column: 'id'})]),
    character_invitation: schema.number([ rules.required(), rules.exists({ table: 'players', column: 'id'})])
  })

  public messages = {
    required: 'The {{ field }} is required to accept invite the player to the guild.',
  }
}
