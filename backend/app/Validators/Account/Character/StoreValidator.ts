import { schema, rules } from '@ioc:Adonis/Core/Validator'
import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import { NamesBlocked } from 'Contracts/enums/NamesBlocked'

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
      rules.maxLength(20),
      rules.notIn(NamesBlocked)
    ]),
    sex: schema.enum([0, 1] as const, [ rules.required() ]),
    vocation: schema.number([ rules.required() ]),
    town: schema.number.optional(),
  })

  public messages = {
    required: 'The {{ field }} is required to create a new character',
    number: 'The {{ field }} inválid',
    minLength: 'Name is too long. Min length <b> {{ options.minLength }} </b> letters',
    maxLength: 'Name is too short. Max length {{ options.maxLength }} letters',
    'name.unique': 'Character name not available',
    'name.notIn': 'The name contains an invalid name.',
  }
}
