import BaseSeeder from '@ioc:Adonis/Lucid/Seeder'
import { Account } from 'App/Models'

export default class AccountSeeder extends BaseSeeder {
  public async run () {
    await Account.create({ 
      email: "electro@test.com", 
      name: "admin",
      password: "admin123",
      type: 5,
      premdays: 0,
      lastday: 0,
      key: "",
      blocked: 0,
      web_lastlogin : 0,
      web_flags : 0,
      email_hash : "",
      email_new : "",
      email_new_time : 0,
      created : 0,
      rlname : "",
      location : "",
      country : "",
      email_code : "0",
      email_next : 0,
      premium_points : 0,
      vote : 0,
    });
  }
}
