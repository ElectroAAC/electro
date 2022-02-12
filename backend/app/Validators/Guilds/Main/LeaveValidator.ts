import { schema, rules } from '@ioc:Adonis/Core/Validator'
import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'

export default class LeaveValidator {
  constructor(protected ctx: HttpContextContract) {}

  public schema = schema.create({
    guild_id: schema.number([ rules.required(), rules.exists({ table: 'guilds', column: 'id'})]),
    character: schema.string({ escape: true, }, [ 
      rules.required(), 
      rules.exists({ table: 'players', column: 'name'}),
      rules.alpha({
        allow: ['space']
      })
    ])
  })

  public messages = {
    required: 'The {{ field }} is required to leave from the guild.',
  }
}
