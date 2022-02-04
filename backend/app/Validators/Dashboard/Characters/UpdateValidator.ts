import { schema, rules } from '@ioc:Adonis/Core/Validator'
import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'

export default class UpdateValidator {
  constructor(protected ctx: HttpContextContract) {}

  public schema = schema.create({
    id: schema.number([rules.required(), rules.exists({ table: 'players', column: 'id' })]),
    name: schema.string({ escape: true }, [
      rules.required(),
      rules.alpha({
        allow: ['space']
      }),
      rules.minLength(3),
      rules.maxLength(20),
    ]),
    world_id: schema.number.optional(),
    group_id: schema.number.optional(),
    account_id: schema.number.optional([rules.exists({ table: 'accounts', column: 'id'})]),
    level: schema.number.optional(),
    vocation: schema.number.optional(),
    health: schema.number.optional(),
    healthmax: schema.number.optional(),
    experience: schema.number.optional(),
    lookbody: schema.number.optional(),
    lookfeet: schema.number.optional(),
    lookhead: schema.number.optional(),
    looklegs: schema.number.optional(),
    looktype: schema.number.optional(),
    lookaddons: schema.number.optional(),
    maglevel: schema.number.optional(),
    mana: schema.number.optional(),
    manamax: schema.number.optional(),
    manaspent: schema.number.optional(),
    soul: schema.number.optional(),
    town_id: schema.number.optional(),
    posx: schema.number.optional(),
    posy: schema.number.optional(),
    posz: schema.number.optional(),
    cap: schema.number.optional(),
    sex: schema.number.optional(),
    lastlogin: schema.number.optional(),
    lastip: schema.number.optional(),
    save: schema.number.optional(),
    skull: schema.number.optional(),
    skulltime: schema.number.optional(),
    rank_id: schema.number.optional(),
    guildnick: schema.number.optional(),
    lastlogout: schema.number.optional(),
    blessings: schema.number.optional(),
    pvp_blessing: schema.number.optional(),
    balance: schema.number.optional(),
    stamina: schema.number.optional(),
    direction: schema.number.optional(),
    loss_experience: schema.number.optional(),
    loss_mana: schema.number.optional(),
    loss_skills: schema.number.optional(),
    loss_containers: schema.number.optional(),
    loss_items: schema.number.optional(),
    premend: schema.number.optional(),
    online: schema.number.optional(),
    marriage: schema.number.optional(),
    marrystatus: schema.number.optional(),
    promotion: schema.number.optional(),
    deleted: schema.number.optional(),
    description: schema.string.optional(),
    created: schema.number.optional(),
    nick_verify: schema.number.optional(),
    old_name: schema.string.optional(),
    hidden: schema.number.optional(),
    worldtransfer: schema.number.optional(),
    comment: schema.string.optional(),
    show_outfit: schema.number.optional(),
    show_eq: schema.number.optional(),
    show_bars: schema.number.optional(),
    show_skills: schema.number.optional(),
    show_quests: schema.number.optional(),
    exphist_lastexp: schema.number.optional(),
    exphist1: schema.number.optional(),
    exphist2: schema.number.optional(),
    exphist3: schema.number.optional(),
    exphist4: schema.number.optional(),
    exphist5: schema.number.optional(),
    exphist6: schema.number.optional(),
    exphist7: schema.number.optional(),
    onlinetimetoday: schema.number.optional(),
    onlinetime1: schema.number.optional(),
    onlinetime2: schema.number.optional(),
    onlinetime3: schema.number.optional(),
    onlinetime4: schema.number.optional(),
    onlinetime5: schema.number.optional(),
    onlinetime6: schema.number.optional(),
    onlinetime7: schema.number.optional(),
    onlinetimeall: schema.number.optional(),
    ip: schema.string.optional(),
    cast: schema.number.optional(),
    castViewers: schema.number.optional(),
    castDescription: schema.string.optional(),
    frags: schema.number.optional(),
    offlinetraining_time: schema.number.optional(),
    offlinetraining_skill: schema.number.optional(),
    broadcasting: schema.number.optional(),
    viewers: schema.number.optional()
  })

  public messages = {
    required: 'The {{ field }} is required to update character',
    minLength: 'Name is too long. Min length {{ options.minLength }} letters',
    maxLength: 'Name is too short. Max length {{ options.maxLength }} letters',
    alpha: 'Invalid character name.',
    'name.unique': 'Character name not available',
    'name.notIn': 'The name contains an invalid name.',
  }
}