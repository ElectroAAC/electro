import { schema, rules } from '@ioc:Adonis/Core/Validator'
import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'

export default class DeleteValidator {
  constructor(protected ctx: HttpContextContract) {}

  public schema = schema.create({
    password: schema.string({ escape: true, }, [ rules.required() ]),
    character_id: schema.number([ rules.required() ])
  })

  public messages = {
    required: 'The {{ field }} is required to create a new character',
  }
}
