import { column, beforeSave, BaseModel, hasMany, HasMany } from '@ioc:Adonis/Lucid/Orm'
import { AccountKey } from 'App/Models'
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
  public rememberMeToken?: string

  @column()
  public salt: string

  @column()
  public premdays: number

  @column()
  public lastday: number

  @column()
  public key: string

  @column()
  public blocked: number

  @column()
  public warnings: number

  @column()
  public group_id: number

  @column()
  public vip_time: number

  @column()
  public web_lastlogin: number

  @column()
  public web_flags: number

  @column()
  public email_hash: string

  @column()
  public email_verified: number

  @column()
  public email_new: string

  @column()
  public email_new_time: number

  @column()
  public created: number

  @column()
  public rlname: string

  @column()
  public location: string

  @column()
  public country: string

  @column()
  public page_access: number

  @column()
  public email_code: string

  @column()
  public email_next: number

  @column()
  public premium_points: number

  @column()
  public vote: number

  @column()
  public last_post: number

  @column()
  public flag: string

  @column()
  public nickname: string

  @column()
  public avatar: string

  @column()
  public about_me: string

  @beforeSave()
  public static async hashPassword (account: Account) {
    if (account.$dirty.password) {
      account.password = crypto.createHash('sha1').update(account.password).digest('hex');
    }
  }

  @hasMany(() => AccountKey)
  public keys: HasMany<typeof AccountKey>
}
