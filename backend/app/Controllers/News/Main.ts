import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import Database from '@ioc:Adonis/Lucid/Database'

export default class NewsController {
  public async show({ request, response }: HttpContextContract) {
    try {
      const news = await Database
        .from('electro_news')
        .select('title', 'body')
        .where('hidden', '=', 0)
        .orderBy('created_at', 'desc')
        .paginate(request.param('page', 1), request.param('limit'));
      
      return response.status(200).send({ status: 200, news });
    } catch(err) {
      console.log('Error getNews Query: ', err);
      return response.status(400).send({ error: 'An error occurred, check the api console.'});
    }
  }
}
