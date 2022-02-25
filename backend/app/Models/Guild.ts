import { BaseModel, belongsTo, column, BelongsTo } from '@ioc:Adonis/Lucid/Orm'
import { Player } from 'App/Models'

export default class Guilds extends BaseModel {
  @column({ isPrimary: true })
  public id: number

  @column()
  public world_id: number

  @column()
  public name: string

  @column()
  public ownerid: number

  @column()
  public motd: string

  @column()
  public balance: number

  @column()
  public description: string

  @column()
  public logo_name: string

  @column()
  public invited_to: number

  @column()
  public invited_by: number

  @column()
  public in_war_with: number

  @column()
  public kills: number

  @column()
  public show: number

  @column()
  public war_time: number

  @belongsTo(() => Player)
  public player: BelongsTo<typeof Player>
}
