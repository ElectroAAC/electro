import { schema, rules } from '@ioc:Adonis/Core/Validator'
import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'

export default class StoreValidator {
  constructor(protected ctx: HttpContextContract) {}

  public schema = schema.create({
    from_account_id: schema.number([ rules.required(), rules.exists({ table: 'accounts', column: 'id'})]),
    from_nick: schema.string.optional(),
    to_player_name: schema.string([ rules.required(), rules.exists({ table: 'players', column: 'name'})]),
    items: schema.array().members(schema.object().members({
      itemId: schema.number(),
      amount: schema.number()
    })),
  })

  public messages = {
    'to_player_name.required': 'The field Player Name is mandatory.',
    'to_player_name.exists': 'Character not found.'
  }
}
