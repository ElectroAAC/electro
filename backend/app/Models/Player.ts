import { BaseModel, column, belongsTo, BelongsTo  } from '@ioc:Adonis/Lucid/Orm'
import { Account } from 'App/Models'

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
  public rank_id: number
  
  @column()
  public guildnick: string
  
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
  
  @column()
  public loss_experience: number
  
  @column({ serializeAs: null })
  public loss_mana: number
  
  @column()
  public loss_skills: number
  
  @column()
  public loss_containers: number
  
  @column()
  public loss_items: number
  
  @column({ serializeAs: null })
  public premend: number
  
  @column()
  public online: number
  
  @column({ serializeAs: null })
  public marriage: number
  
  @column({ serializeAs: null })
  public marrystatus: number
  
  @column({ serializeAs: null })
  public promotion: number
  
  @column()
  public deleted: number
  
  @column({ serializeAs: null })
  public description: string
  
  @column()
  public created: number
  
  @column({ serializeAs: null })
  public nick_verify: number
  
  @column({ serializeAs: null })
  public old_name: string
  
  @column({ serializeAs: null })
  public hidden: number
  
  @column({ serializeAs: null })
  public worldtransfer: number
  
  @column({ serializeAs: null })
  public comment: string
  
  @column({ serializeAs: null })
  public show_outfit:number
  
  @column({ serializeAs: null })
  public show_eq:number
  
  @column({ serializeAs: null })
  public show_bars:number
  
  @column({ serializeAs: null })
  public show_skills:number
  
  @column({ serializeAs: null })
  public show_quests:number
  
  @column({ serializeAs: null })
  public exphist_lastexp: number
  
  @column({ serializeAs: null })
  public exphist1: number
  
  @column({ serializeAs: null })
  public exphist2: number
  
  @column({ serializeAs: null })
  public exphist3: number
  
  @column({ serializeAs: null })
  public exphist4: number
  
  @column({ serializeAs: null })
  public exphist5: number
  
  @column({ serializeAs: null })
  public exphist6: number
  
  @column({ serializeAs: null })
  public exphist7: number
  
  @column({ serializeAs: null })
  public onlinetimetoday: number
  
  @column({ serializeAs: null })
  public onlinetime1: number
  
  @column({ serializeAs: null })
  public onlinetime2: number
  
  @column({ serializeAs: null })
  public onlinetime3: number
  
  @column()
  public onlinetime4: number
  
  @column({ serializeAs: null })
  public onlinetime5: number
  
  @column({ serializeAs: null })
  public onlinetime6: number
  
  @column({ serializeAs: null })
  public onlinetime7: number
  
  @column({ serializeAs: null })
  public onlinetimeall: number
  
  @column({ serializeAs: null })
  public ip: string
  
  @column({ serializeAs: null })
  public cast: number
  
  @column({ serializeAs: null })
  public filed_list: string
  
  @column({ serializeAs: null })
  public castViewers: number
  
  @column({ serializeAs: null })
  public castDescription: string
  
  @column()
  public frags: number
  
  @column({ serializeAs: null })
  public offlinetraining_time: number
  
  @column({ serializeAs: null })
  public offlinetraining_skill: number
  
  @column({ serializeAs: null })
  public broadcasting: number
  
  @column()
  public viewers: number
  
  @column()
  public auction_balance: number
  
  @belongsTo(() => Account)
  public account: BelongsTo<typeof Account>
}
