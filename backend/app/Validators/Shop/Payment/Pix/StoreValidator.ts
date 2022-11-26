import { schema, rules } from '@ioc:Adonis/Core/Validator'
import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'

export default class StoreValidator {
  constructor(protected ctx: HttpContextContract) {}

  public schema = schema.create({
    account_id: schema.number([ rules.required(), rules.exists({ table: 'accounts', column: 'id'})]),
    value: schema.number()
  })

  public messages = {}
}
