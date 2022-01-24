import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import { StoreValidator, UpdateValidator } from 'App/Validators/News'
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

      await Database.table('electro_news').returning('id').insert(news);

      return response.status(200).send({ status: 200, message: 'New Post created successfully!'});
    } catch (err) {
      console.log('Error createNewPage Query: ', err);
      return response.badRequest(err.messages);
    }
  }

  public async show({}: HttpContextContract) {}

  public async edit({}: HttpContextContract) {}

  public async update({ request, response, auth, bouncer }: HttpContextContract) {
    await bouncer.with('DashboardPolicy').authorize('viewList');

    const data = await request.validate(UpdateValidator);

    const account = auth.user;

    if (!account || !account.id) {
      return response.unauthorized();
    }

    await Database.from('electro_news')
      .where('id', '=', data.news_id)
      .update({ 
        title: data.title,
        body: data.description,
        updated_at: new Date()
      });
    
    return response.status(200).send({ status: 200, message: "Post successfully updated." });
  }

  public async destroy({}: HttpContextContract) {}
}
