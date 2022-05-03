import { Account as AccountModel } from 'App/Models'
import Database from '@ioc:Adonis/Lucid/Database'
import encrypt from 'js-sha1'

class Account {
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
      return await AccountModel.query().where('id', account_id).where('password', encrypt(password)).firstOrFail();
    } catch (err) {
      console.log(err);
      return err;
    }
  }

  public async validateName(account_id: number, name: string): Promise<Object[]>{
    try {
      return await Database
        .from('accounts')
        .select('id')
        .where('name', '=', name)
        .andWhere('id', '<>', account_id);
    } catch (err) {
      console.log(err);
      return err;
    }
  }
}

class AccountView {
  public async getTotalAccounts(): Promise<Object[]> {  
    try {
      return await Database
        .from('accounts')
        .count('* as total');
    } catch (err) {
      console.log(err);
      return err;
    }
  }

  public async getAccountById(id: number): Promise<Object[]> {  
    try {
      return await Database
        .from('accounts')
        .select('id', 'name', 'premdays', 'email', 'group_id', 'web_flags', 'premium_points', 'key')
        .where('id', '=', id);
    } catch (err) {
      console.log(err);
      return err;
    }
  }

  public async getAccountByName(name: string): Promise<Object[]> {  
    try {
      return await Database
        .from('accounts')
        .select('id', 'name', 'premdays', 'email', 'group_id', 'web_flags', 'premium_points', 'key')
        .where('name', '=', name);
    } catch (err) {
      console.log(err);
      return err;
    }
  }

  public async getTopPremiumPoints(): Promise<Object[]> {  
    try {
      return await Database
        .from('accounts')
        .select('premium_points', 'name')
        .orderBy('premium_points', 'desc')
        .limit(10);
    } catch (err) {
      console.log(err);
      return err;
    }
  }
}

class AccountRepository {
  public async update(account_id: number, data: any): Promise<Object[]> {  
    try {
      return await Database
        .from('accounts')
        .where('id', '=', account_id)
        .update(data);
    } catch (err) {
      console.log(err);
      return err;
    }
  }
}

export { Account, AccountRepository, AccountView };