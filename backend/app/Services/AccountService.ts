import { Account } from 'App/Models'
import Database from '@ioc:Adonis/Lucid/Database'
import encrypt from 'js-sha1'

export default class AccountService {
  public async removePremiumPoints(account_id: number, premium_points: number): Promise<Object[]> {  
    try {
      const account = await Database.from('accounts').select('premium_points').where('id', '=', account_id);

      return await Database.from('accounts').where('id', '=', account_id).update({ premium_points: account[0].premium_points - premium_points });
    } catch (err) {
      console.log(err);
      return err;
    }
  }

  public async validatePassword(account_id: number, password: string): Promise<Object[]> {
    try {
      return await Account.query().where('id', account_id).where('password', encrypt(password)).firstOrFail();
    } catch (err) {
      console.log(err);
      return err;
    }
  }
}