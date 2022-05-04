import { BaseModel, column, belongsTo, BelongsTo } from '@ioc:Adonis/Lucid/Orm'
import { Account, Player, ShopCategory, ShopCommunication, ShopItem } from 'App/Models'

export default class ShopHistory extends BaseModel {
  @column({ isPrimary: true })
  public id: number

  @column()
  public status: string

  @column()
  public trans_start: number

  @column()
  public trans_real: number

  @column()
  public is_pacc: number

  @belongsTo(() => Account)
  public from_account_id: BelongsTo<typeof Account>

  @belongsTo(() => Account)
  public to_account_id: BelongsTo<typeof Account>

  @belongsTo(() => Player)
  public to_player_id: BelongsTo<typeof Player>

  @belongsTo(() => ShopCategory)
  public category_id: BelongsTo<typeof ShopCategory>

  @belongsTo(() => ShopCommunication)
  public communication_id: BelongsTo<typeof ShopCommunication>

  @belongsTo(() => ShopItem)
  public offer_id: BelongsTo<typeof ShopItem>
}
