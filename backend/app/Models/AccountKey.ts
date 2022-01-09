import { BaseModel, column, belongsTo, BelongsTo  } from '@ioc:Adonis/Lucid/Orm'
import { Account } from 'App/Models'

export default class AccountKey extends BaseModel {
  @column({ isPrimary: true })
  public id: number

  @column()
  public key: string

  @column()
  public accountId: number

  @belongsTo(() => Account)
  public account: BelongsTo<typeof Account>
}
