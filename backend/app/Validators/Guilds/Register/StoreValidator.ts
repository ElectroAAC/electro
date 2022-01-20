import { schema, rules } from '@ioc:Adonis/Core/Validator'
import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'

export default class StoreValidator {
  constructor(protected ctx: HttpContextContract) {}

  public schema = schema.create({
    name: schema.string({ escape: true, }, [
      rules.required(), 
      rules.unique({ 
        table: 'guilds', 
        column: 'name'
      }),
      rules.alpha({
        allow: ['space']
      }),
      rules.minLength(3),
      rules.maxLength(20)
    ]),
    character_id: schema.number([ rules.required() ]),
  })

  public messages = {
    required: 'The {{ field }} is required to create a new guild',
    unique: 'Invalid guild name.',
    number: 'The {{ field }} inválid',
    minLength: 'Name is too long. Min length {{ options.minLength }} letters',
    maxLength: 'Name is too short. Max length {{ options.maxLength }} letters',
    alpha: 'Invalid guild name.',
    'name.unique': 'guild name not available',
    'name.notIn': 'The name contains an invalid name.',
  }
}
