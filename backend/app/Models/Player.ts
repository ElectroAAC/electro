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
  
  @column()
  public manaspent: number
  
  @column()
  public soul: number
  
  @column()
  public town_id: number
  
  @column()
  public posx: number
  
  @column()
  public posy: number
  
  @column()
  public posz: number
  
  @column()
  public conditions: string
  
  @column()
  public cap: number
  
  @column()
  public sex: number
  
  @column()
  public lastlogin: number
  
  @column()
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
  
  @column()
  public pvp_blessing: number
  
  @column()
  public balance: number
  
  @column()
  public stamina: number
  
  @column()
  public direction: number
  
  @column()
  public loss_experience: number
  
  @column()
  public loss_mana: number
  
  @column()
  public loss_skills: number
  
  @column()
  public loss_containers: number
  
  @column()
  public loss_items: number
  
  @column()
  public premend: number
  
  @column()
  public online: number
  
  @column()
  public marriage: number
  
  @column()
  public marrystatus: number
  
  @column()
  public promotion: number
  
  @column()
  public deleted: number
  
  @column()
  public description: string
  
  @column()
  public created: number
  
  @column()
  public nick_verify: number
  
  @column()
  public old_name: string
  
  @column()
  public hidden: number
  
  @column()
  public worldtransfer: number
  
  @column()
  public comment: string
  
  @column()
  public show_outfit:number
  
  @column()
  public show_eq:number
  
  @column()
  public show_bars:number
  
  @column()
  public show_skills:number
  
  @column()
  public show_quests:number
  
  @column()
  public exphist_lastexp: number
  
  @column()
  public exphist1: number
  
  @column()
  public exphist2: number
  
  @column()
  public exphist3: number
  
  @column()
  public exphist4: number
  
  @column()
  public exphist5: number
  
  @column()
  public exphist6: number
  
  @column()
  public exphist7: number
  
  @column()
  public onlinetimetoday: number
  
  @column()
  public onlinetime1: number
  
  @column()
  public onlinetime2: number
  
  @column()
  public onlinetime3: number
  
  @column()
  public onlinetime4: number
  
  @column()
  public onlinetime5: number
  
  @column()
  public onlinetime6: number
  
  @column()
  public onlinetime7: number
  
  @column()
  public onlinetimeall: number
  
  @column()
  public ip: string
  
  @column()
  public cast: number
  
  @column()
  public filed_list: string
  
  @column()
  public castViewers: number
  
  @column()
  public castDescription: string
  
  @column()
  public frags: number
  
  @column()
  public offlinetraining_time: number
  
  @column()
  public offlinetraining_skill: number
  
  @column()
  public broadcasting: number
  
  @column()
  public viewers: number
  
  @column()
  public auction_balance: number
  
  @belongsTo(() => Account)
  public account: BelongsTo<typeof Account>
}
