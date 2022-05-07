import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import { UpdateValidator } from 'App/Validators/Dashboard/Accounts'
import { 
  Account,
  AccountView,
  AccountRepository,
  CharacterView
} from 'App/Services'
import { Account as AccountModel } from 'App/Models';

export default class AccountsController {
  public account: Account = new Account();
  public accountRepository: AccountRepository = new AccountRepository();
  public accountView: AccountView = new AccountView();
  public characterView: CharacterView = new CharacterView();

  public async index(ctx: HttpContextContract) {
    try {
      await ctx.bouncer.with('DashboardPolicy').authorize('admin');
      
      const accounts = await this.accountView.getTotalAccounts();

      return ctx.response.status(200).send({ result: accounts});
    } catch(err) {
      console.log('Error getTotalAccounts Query: ', err);
      return ctx.response.status(400).send({ status: 200, message: 'An error occurred, check the api console.'})
    }
  }

  public async show(ctx: HttpContextContract) {
    try {
      await ctx.bouncer.with('DashboardPolicy').authorize('admin');

      const account = await this.accountView.getAccountByName(ctx.request.param('name')) as AccountModel[];
       
      if (!account.length) {
        return ctx.response.status(404).send({ message: "Account not found!"});
      }

      const characters = await this.characterView.getByAccount(account[0].id);

      return ctx.response.status(200).send({ status: 200, result: { account, characters }});
    } catch(err) {
      console.log('Error findAccount Query: ', err);
      return ctx.response.status(400).send({ message: 'An error occurred, check the api console.'})
    }
  }

  public async update(ctx: HttpContextContract) {
    try {
      await ctx.bouncer.with('DashboardPolicy').authorize('admin');
      const data = await ctx.request.validate(UpdateValidator);
      
      const account = await this.account.validateName(data.id, data.name);
      
      if (account.length) {
        return ctx.response.status(404).send({ message: "Error. The username is already used."});
      }
      
      const affectedRows = await this.accountRepository.update(data.id, data);
      
      if (!affectedRows) {
        return ctx.response.status(404).send({ message: "Account not found."});
      }
      
      return ctx.response.status(200).send({ status: 200, message: "Account successfully updated." });
    } catch (err) {
      console.log('Error updateAccount Query: ', err);
      return ctx.response.status(400).send({ message: err})
    }
  }
}
