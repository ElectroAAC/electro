import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import { StoreValidator, UpdateValidator } from 'App/Validators/News'
import { NewsRepository, NewsView } from 'App/Services';

export default class AccountsController {
  public newsView: NewsView = new NewsView();
  public newsRepository: NewsRepository = new NewsRepository();

  public async index(ctx: HttpContextContract) {
    try {
      const news = await this.newsView.getNews(ctx.request.param('page'), ctx.request.param('limit'));
      
      return ctx.response.status(200).send({ status: 200, news });
    } catch(err) {
      console.log('Error getNews Query: ', err);
      return ctx.response.status(400).send({ error: 'An error occurred, check the api console.'});
    }
  }

  public async store(ctx: HttpContextContract) {
    try {
      await ctx.bouncer.with('DashboardPolicy').authorize('admin');

      const data = await ctx.request.validate(StoreValidator);

      const account = ctx.auth.user;

      if (!account || !account.id) {
        return ctx.response.unauthorized();
      }

      const news = {
        id: null,
        account_id: account.id,
        title: data.title,
        body: data.description,
        hidden: 0,
        created_at: new Date()
      }

      const result = await this.newsRepository.create(news);
      
      if (!result.length) {
        return ctx.response.status(404).send({ message: "Error creating a post."});
      }

      return ctx.response.status(200).send({ status: 200, message: 'New Post created successfully!'});
    } catch (err) {
      console.log('Error createNewPage Query: ', err);
      return ctx.response.badRequest(err.messages);
    }
  }

  public async show(ctx: HttpContextContract) {
    try {
      await ctx.bouncer.with('DashboardPolicy').authorize('admin');

      const page = await this.newsView.findNewsById(ctx.request.param('id'));
      if (!page.length) {
        return ctx.response.status(404).send({ message: 'News not found.' });
      }
      return ctx.response.status(200).send({ status: 200, page });
    } catch (err) {
      console.log('Error getNews Query: ', err);
      return ctx.response.status(400).send({ error: 'An error occurred, check the api console.'});
    }
  }

  public async update(ctx: HttpContextContract) {
    try {
      await ctx.bouncer.with('DashboardPolicy').authorize('admin');

      const data = await ctx.request.validate(UpdateValidator);

      const account = ctx.auth.user;

      if (!account || !account.id) {
        return ctx.response.unauthorized();
      }

      const result: any = await this.newsRepository.update(data.news_id, data);

      if (result === 0) {
        return ctx.response.status(404).send({ message: "Error updating post"});
      }
      
      return ctx.response.status(200).send({ status: 200, message: "Post successfully updated." });
    } catch (err) {
      console.log('Error updateNews Query: ', err);
      return ctx.response.status(400).send({ error: 'An error occurred, check the api console.'});
    }
  }
}
