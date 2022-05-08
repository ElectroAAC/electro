import { column, beforeSave, BaseModel, hasMany, HasMany } from '@ioc:Adonis/Lucid/Orm'
import { AccountKey, Player, News } from 'App/Models'
import crypto from 'crypto';

export default class Account extends BaseModel {
  @column({ isPrimary: true })
  public id: number

  @column()
  public name: string

  @column()
  public email: string

  @column({ serializeAs: null })
  public password: string

  @column()
  public secret?: string

  @column()
  public type: number

  @column()
  public premdays: number

  @column()
  public lastday: number

  @column({ serializeAs: null })
  public key: string

  @column({ serializeAs: null })
  public blocked: number

  @column({ serializeAs: null })
  public web_lastlogin: number

  @column({ serializeAs: null })
  public web_flags: number

  @column({ serializeAs: null })
  public rlname: string

  @column({ serializeAs: null })
  public location: string

  @column({ serializeAs: null })
  public country: string

  @column({ serializeAs: null })
  public email_hash: string

  @column({ serializeAs: null })
  public email_new: string

  @column({ serializeAs: null })
  public email_code: string

  @column({ serializeAs: null })
  public email_verified: string

  @column({ serializeAs: null })
  public email_new_time: number

  @column({ serializeAs: null })
  public email_next: number

  @column()
  public created: number

  @column()
  public creation: number

  @column()
  public premium_points: number

  @column({ serializeAs: null })
  public vote: number

  @beforeSave()
  public static async hashPassword (account: Account) {
    if (account.$dirty.password) {
      account.password = crypto.createHash('sha1').update(account.password).digest('hex');
    }
  }

  @hasMany(() => AccountKey)
  public keys: HasMany<typeof AccountKey>

  @hasMany(() => Player)
  public players: HasMany<typeof Player>

  @hasMany(() => News)
  public news: HasMany<typeof News>
}
