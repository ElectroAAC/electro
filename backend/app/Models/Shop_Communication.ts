import { BaseModel, column, belongsTo, BelongsTo } from '@ioc:Adonis/Lucid/Orm'
import { Player } from 'App/Models'

export default class ShopCommunication extends BaseModel {
  @column({ isPrimary: true })
  public id: number

  @column()
  public type: string

  @column()
  public action: string

  @column()
  public itemId1: string

  @column()
  public count1: string

  @column()
  public itemId2: string

  @column()
  public count2: string

  @column()
  public category_name: string

  @column()
  public offer_name: string

  @column()
  public param7: string

  @column()
  public delete_it: number

  @belongsTo(() => Player)
  public player_id: BelongsTo<typeof Player>
}
