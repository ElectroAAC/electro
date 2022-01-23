import { schema } from '@ioc:Adonis/Core/Validator'
import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'

export default class StoreValidator {
  constructor(protected ctx: HttpContextContract) {}

  public schema = schema.create({
    news_id: schema.number(),
    title: schema.string({ trim: true }),
    description: schema.string({ trim: true })
  })

  public messages = {
    required: 'The {{ field }} is required to create a new post',
  }
}
