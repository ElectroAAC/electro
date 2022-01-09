import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import { StoreValidator } from 'App/Validators/Account/Register'
import { Account, AccountKey } from 'App/Models'
import faker from 'faker'
import Mail from '@ioc:Adonis/Addons/Mail'

export default class AccountRegisterController {
  public async store({ request, response }: HttpContextContract) {
    const { email, name, password } = await request.validate(StoreValidator);
    
    const account = await Account.create({ 
      email, 
      name,
      password,
      salt: "",
      premdays: 0,
      lastday: 0,
      key: "",
      blocked: 0,
      warnings : 0,
      group_id : 1,
      vip_time : 1,
      web_lastlogin : 1298670924,
      web_flags : 0,
      email_hash : "",
      email_verified : 0,
      email_new : "",
      email_new_time : 0,
      created : 0,
      rlname : "",
      location : "",
      country : "",
      page_access : 0,
      email_code : "0",
      email_next : 0,
      premium_points : 0,
      vote : 0,
      last_post : 0,
      flag : "",
      nickname : "",
      avatar : "",
      about_me : ""
    });

    await account.save();

    const key = faker.datatype.uuid() + new Date().getTime();

    account.related('keys').create({ key });

    Mail.send(( message ) => {
      message.to(email);
      message.from('electro@no-reply.com', 'ElectroAAC');
      message.subject('Account Created');
      message.htmlView('mails/register')
    })

    return response.send({ status: 200, message: 'Created Successfully'});
  }

  public async show({ params }: HttpContextContract) {
    const accountKey = await AccountKey.findByOrFail('key', params.code);
    const account = await accountKey.related('account').query().firstOrFail()

    return account;
  }

  public async update({}: HttpContextContract) {}
}
