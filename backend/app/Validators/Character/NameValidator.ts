import { schema, rules } from '@ioc:Adonis/Core/Validator'
import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import { NamesBlocked } from 'Contracts/enums/NamesBlocked'

export default class UpdateValidator {
  constructor(protected ctx: HttpContextContract) {}

  public schema = schema.create({
    character_id: schema.number([ 
      rules.required(),
      rules.exists({ table: 'players', column: 'id' }) 
    ]),
    new_name: schema.string({ escape: true, }, [
      rules.required(), 
      rules.unique({ 
        table: 'players', 
        column: 'name',
        caseInsensitive: true
      }),
      rules.alpha({
        allow: ['space']
      }),
      rules.minLength(3),
      rules.maxLength(20),
      rules.notIn(NamesBlocked)
    ]),
  })

  public messages = {
    'character_id.exists': 'This character does not exist.',
    required: 'The {{ field }} is required to change name',
    'new_name.unique': 'That name already exists.',
    minLength: 'Name is too long. Min length {{ options.minLength }} letters',
    maxLength: 'Name is too short. Max length {{ options.maxLength }} letters',
    alpha: 'Invalid character name.',
    'name.unique': 'Character name not available',
    'name.notIn': 'The name contains an invalid name.',
  }
}
