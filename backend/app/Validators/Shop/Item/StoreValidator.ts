import { schema, rules } from '@ioc:Adonis/Core/Validator'
import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'

export default class StoreValidator {
  constructor(protected ctx: HttpContextContract) {}

  public schema = schema.create({
    category_id: schema.number([ rules.required(), rules.exists({ table: 'electro_shop_categories', column: 'id'})]),
    name: schema.string({ escape: true, }, [
      rules.required(), 
      rules.unique({ 
        table: 'electro_shop_items', 
        column: 'name'
      }),
      rules.minLength(3),
      rules.maxLength(20)
    ]),
    description: schema.string(),
    price: schema.number([ rules.required() ]),
    itemId1: schema.number([ rules.required() ]),
    count1: schema.number([ rules.required() ]),
    itemId2: schema.number.optional(),
    count2: schema.number.optional()
  })

  public messages = {
    required: 'The {{ field }} is required to create a new offer',
    unique: 'Invalid offer name.',
    minLength: 'Name is too long. Min length {{ options.minLength }} letters',
    maxLength: 'Name is too short. Max length {{ options.maxLength }} letters',
    'name.unique': 'offer name not available',
    'name.notIn': 'The name contains an invalid name.',
  }
}
