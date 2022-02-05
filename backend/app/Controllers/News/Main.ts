import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import { NewsView } from 'App/Services'

export default class NewsController {
  public newsView: NewsView = new NewsView();

  public async show(ctx: HttpContextContract) {
    try {
      const news = await this.newsView.getNews(ctx.request.param('page'), ctx.request.param('limit'));
      
      return ctx.response.status(200).send({ status: 200, news });
    } catch(err) {
      console.log('Error getNews Query: ', err);
      return ctx.response.status(400).send({ error: 'An error occurred, check the api console.'});
    }
  }
}
