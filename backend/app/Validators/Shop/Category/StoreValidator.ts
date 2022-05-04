import { schema, rules } from '@ioc:Adonis/Core/Validator'
import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'

export default class StoreValidator {
  constructor(protected ctx: HttpContextContract) {}

  public schema = schema.create({
    name: schema.string({ escape: true, }, [
      rules.required(), 
      rules.unique({ 
        table: 'electro_shop_categories', 
        column: 'name'
      }),
      rules.alpha({
        allow: ['space']
      }),
      rules.minLength(3),
      rules.maxLength(20)
    ]),
    description: schema.string(),
  })

  public messages = {
    required: 'The {{ field }} is required to create a new category',
    unique: 'Invalid category name.',
    minLength: 'Name is too long. Min length {{ options.minLength }} letters',
    maxLength: 'Name is too short. Max length {{ options.maxLength }} letters',
    alpha: 'Invalid category name.',
    'name.unique': 'category name not available',
    'name.notIn': 'The name contains an invalid name.',
  }
}
