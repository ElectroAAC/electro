import { schema } from '@ioc:Adonis/Core/Validator'
import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'

export default class StoreValidator {
  constructor(protected ctx: HttpContextContract) {}

  public schema = schema.create({
    category_id: schema.number(),
    name: schema.string({ trim: true }),
    description: schema.string({ trim: true }),
    hidden: schema.boolean.optional()
  })

  public messages = {
    required: 'The {{ field }} is required to update category',
  }
}
