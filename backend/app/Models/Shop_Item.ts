import { BaseModel, column, belongsTo, BelongsTo } from '@ioc:Adonis/Lucid/Orm'
import { ShopCategory } from 'App/Models'

export default class ShopItem extends BaseModel {
  @column({ isPrimary: true })
  public id: number

  @column()
  public name: string

  @column()
  public description: string

  @column()
  public price: number

  @column()
  public itemId1: number

  @column()
  public count1: number

  @column()
  public itemId2: number

  @column()
  public count2: number

  @column()
  public hidden: number

  @belongsTo(() => ShopCategory)
  public category_id: BelongsTo<typeof ShopCategory>
}
