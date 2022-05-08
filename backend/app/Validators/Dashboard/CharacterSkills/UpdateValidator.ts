import { schema, rules } from '@ioc:Adonis/Core/Validator'
import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'

export default class UpdateValidator {
  constructor(protected ctx: HttpContextContract) {}

  public schema = schema.create({
    id: schema.number([rules.required(), rules.exists({ table: 'players', column: 'id' })]),
    skills: schema.array().members(
      schema.object().members({
        skill_name: schema.string(),
        value: schema.number(),
        count: schema.number()
      })
    ),
  })

  public messages = {};
}
