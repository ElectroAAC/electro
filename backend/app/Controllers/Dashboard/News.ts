import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import { StoreValidator } from 'App/Validators/News'
import Database from '@ioc:Adonis/Lucid/Database'

export default class AccountsController {
  public async store({ request, response, auth, bouncer }: HttpContextContract) {
    try {
      await bouncer.with('DashboardPolicy').authorize('viewList');

      const data = await request.validate(StoreValidator);

      const account = auth.user;

      if (!account || !account.id) {
        return response.unauthorized();
      }

      const news = {
        id: null,
        account_id: account.id,
        title: data.title,
        body: data.description,
        hidden: 0,
        created_at: new Date()
      }

      const result = await Database.table('electro_news').returning('id').insert(news);

      console.log(result);

      return response.status(200).send({ status: 200, message: 'New Post created successfully!'});
    } catch (err) {
      console.log('Error createNewPage Query: ', err);
      return response.badRequest(err.messages);
    }
  }

  public async show({}: HttpContextContract) {}

  public async edit({}: HttpContextContract) {}

  public async update({}: HttpContextContract) {}

  public async destroy({}: HttpContextContract) {}
}
