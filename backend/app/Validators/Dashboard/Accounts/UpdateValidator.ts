import { schema, rules } from '@ioc:Adonis/Core/Validator'
import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'

export default class UpdateValidator {
  constructor(protected ctx: HttpContextContract) {}

  public schema = schema.create({
    id: schema.number([rules.required(), rules.exists({ table: 'accounts', column: 'id' })]),
    name: schema.string({ escape: true }, [
      rules.required(),
      rules.alpha(),
      rules.minLength(3),
      rules.maxLength(20),
    ]),
    email: schema.string({ trim: true }, [rules.required()]),
    premdays: schema.number.optional(),
    type: schema.number.optional(),
    web_flags: schema.number.optional(),
    premium_points: schema.number.optional()
  })

  public messages = {
    required: 'The {{ field }} is required to create a new character',
    minLength: 'Name is too long. Min length {{ options.minLength }} letters',
    maxLength: 'Name is too short. Max length {{ options.maxLength }} letters',
    alpha: 'Invalid character name.',
    'name.unique': 'Character name not available',
    'name.notIn': 'The name contains an invalid name.',
  }
}
