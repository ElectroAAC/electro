import { schema, rules } from '@ioc:Adonis/Core/Validator'
import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'

export default class StoreValidator {
  constructor(protected ctx: HttpContextContract) {}

  public schema = schema.create({
    name: schema.string({ escape: true, }, [
      rules.required(), 
      rules.unique({ 
        table: 'players', 
        column: 'name'
      }),
      rules.alpha({
        allow: ['space']
      }),
      rules.minLength(3),
      rules.maxLength(20)
    ]),
    sex: schema.enum([0, 1] as const, [ rules.required() ]),
    vocation: schema.number([ rules.required() ]),
    town: schema.number.nullable(),
  })

  public messages = {
    required: 'The {{ field }} is required to create a new character',
    'name.unique': 'Character name not available'
  }
}
