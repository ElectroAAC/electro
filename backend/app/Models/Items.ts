import { BaseModel, column } from '@ioc:Adonis/Lucid/Orm'

export default class Item extends BaseModel {
  @column({ isPrimary: true })
  public player_id: number

  @column()
  public pid: number

  @column()
  public sid: number

  @column()
  public itemtype: number

  @column()
  public count: number

  @column()
  public attributes: string

  @column()
  public serial: string
}
