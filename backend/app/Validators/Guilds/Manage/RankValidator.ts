import { schema, rules } from '@ioc:Adonis/Core/Validator'
import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'

export default class RankValidator {
  constructor(protected ctx: HttpContextContract) {}

  public schema = schema.create({
    guild_id: schema.number([ rules.required(), rules.exists({ table: 'guilds', column: 'id'})]),
    character_id: schema.number([ rules.required(), rules.exists({ table: 'players', column: 'id'})]),
    rank_level: schema.number([ rules.required() ])
  })

  public messages = {
    required: 'The {{ field }} is required to change rank a guild',
  }
}
