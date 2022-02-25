import { schema, rules } from '@ioc:Adonis/Core/Validator'
import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'

export default class StoreValidator {
  constructor(protected ctx: HttpContextContract) {}

  public schema = schema.create({
    guild_id: schema.number([ rules.required(), rules.exists({ table: 'guilds', column: 'id'})]),
    character_invitation: schema.string({ escape: true, },[ 
      rules.required(), 
      rules.exists({ table: 'players', column: 'name'}),
      rules.alpha({
        allow: ['space']
      })
    ])
  })

  public messages = {
    required: 'The {{ field }} is required to invite the player to the guild.',
  }
}
