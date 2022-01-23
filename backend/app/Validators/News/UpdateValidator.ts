import { schema } from '@ioc:Adonis/Core/Validator'
import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'

export default class StoreValidator {
  constructor(protected ctx: HttpContextContract) {}

  public schema = schema.create({
    title: schema.string({ trim: true }),
    description: schema.string({ trim: true })
  })

  public messages = {
    required: 'The {{ field }} is required to create a new post',
  }
}
