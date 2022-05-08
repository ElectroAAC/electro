import { BaseModel, column, belongsTo, BelongsTo, hasMany, HasMany  } from '@ioc:Adonis/Lucid/Orm'
import { Account, Guild } from 'App/Models'

export default class Player extends BaseModel {
  @column({ isPrimary: true })
  public id: number
  
  @column()
  public name: string

  @column()
  public world_id: number
  
  @column()
  public group_id: number

  @column()
  public account_id: number
  
  @column()
  public level: number
  
  @column()
  public vocation: number
  
  @column()
  public health: number
  
  @column()
  public healthmax: number
  
  @column()
  public experience:number
  
  @column()
  public lookbody: number
  
  @column()
  public lookfeet: number
  
  @column()
  public lookhead: number
  
  @column()
  public looklegs: number
  
  @column()
  public looktype: number
  
  @column()
  public lookaddons: number
  
  @column()
  public maglevel: number
  
  @column()
  public mana: number
  
  @column()
  public manamax: number
  
  @column({ serializeAs: null })
  public manaspent: number
  
  @column({ serializeAs: null })
  public soul: number
  
  @column({ serializeAs: null })
  public town_id: number
  
  @column({ serializeAs: null })
  public posx: number
  
  @column({ serializeAs: null })
  public posy: number
  
  @column({ serializeAs: null })
  public posz: number
  
  @column({ serializeAs: null })
  public conditions: string
  
  @column({ serializeAs: null })
  public cap: number
  
  @column()
  public sex: number
  
  @column()
  public lastlogin: number
  
  @column({ serializeAs: null })
  public lastip: number
  
  @column()
  public skull: number
  
  @column()
  public skulltime: number
  
  @column()
  public lastlogout: number
  
  @column()
  public blessings: number
  
  @column({ serializeAs: null })
  public pvp_blessing: number
  
  @column()
  public balance: number
  
  @column()
  public stamina: number
  
  @column({ serializeAs: null })
  public direction: number
  
  @column({ serializeAs: null })
  public description: string
  
  @column()
  public created: number
  
  @column({ serializeAs: null })
  public hidden: number
  
  @column({ serializeAs: null })
  public comment: string
  
  @column({ serializeAs: null })
  public deletion: number
  
  @column({ serializeAs: null })
  public onlinetime: number
  
  @column({ serializeAs: null })
  public online_time: number
  
  @column()
  public skill_fist: number
  
  @column()
  public skill_fist_tries: number
  
  @column()
  public skill_club: number
  
  @column()
  public skill_club_tries: number
  
  @column()
  public skill_sword: number
  
  @column()
  public skill_sword_tries: number
  
  @column()
  public skill_axe: number
  
  @column()
  public skill_axe_tries: number
  
  @column()
  public skill_dist: number
  
  @column()
  public skill_dist_tries: number
  
  @column()
  public skill_shielding: number
  
  @column()
  public skill_shielding_tries: number
  
  @column()
  public skill_fishing: number
  
  @column()
  public skill_fishing_tries: number

  @column({ serializeAs: null })
  public autoloot: string
  
  @belongsTo(() => Account)
  public account: BelongsTo<typeof Account>
  
  @hasMany(() => Guild)
  public news: HasMany<typeof Guild>
}
