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
  public param1: string

  @column()
  public param2: string

  @column()
  public param3: string

  @column()
  public param4: string

  @column()
  public param5: string

  @column()
  public param6: string

  @column()
  public param7: string

  @column()
  public delete_it: number

  @belongsTo(() => Player)
  public player_id: BelongsTo<typeof Player>
}
