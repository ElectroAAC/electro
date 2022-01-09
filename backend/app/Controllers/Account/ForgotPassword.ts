import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import { StoreValidator, UpdateValidator } from 'App/Validators/Account/ForgotPassword'
import { Account, AccountKey } from 'App/Models'
import Mail from '@ioc:Adonis/Addons/Mail'
import faker from 'faker'

export default class UserForgotPasswordController {
  public async store({ request }: HttpContextContract) {
    const { email, redirectUrl } = await request.validate(StoreValidator)

    const account = await Account.findByOrFail('email', email)

    const key = faker.datatype.uuid() + new Date().getTime()

    await account.related('keys').create({ key })

    const link = `${redirectUrl.replace(/\/$/, '')}/${key}`

    await Mail.send((message) => {
      message.to(email)
      message.from('electro@no-reply.com', 'ElectroAAC')
      message.subject('Recover Password')
      message.htmlView('mails/forgot-password', { link: link })
    })
  }

  public async show({ params }: HttpContextContract) {
    await AccountKey.findByOrFail('key', params.key)
  }

  public async update({ request }: HttpContextContract) {
    const { key, password } = await request.validate(UpdateValidator)

    const accountKey = await AccountKey.findByOrFail('key', key)

    const account = await accountKey.related('account').query().firstOrFail();

    accountKey.load('account')

    account.merge({ password })

    await account.save()

    await accountKey.delete()

    return { 
      message: 'Password changed successfully'
    }
  }
}