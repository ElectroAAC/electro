import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import { StoreValidator, UpdateValidator } from 'App/Validators/Shop/Category'
import { ShopCategoryView, ShopCategoryRepository } from 'App/Services';

export default class ShopCategoryController {
  public categoryView: ShopCategoryView = new ShopCategoryView();
  public categoryRepository: ShopCategoryRepository = new ShopCategoryRepository();

  public async index(ctx: HttpContextContract) {
    try {
      const categories = await this.categoryView.getCategories(ctx.request.param('page'), ctx.request.param('limit'));
      
      return ctx.response.status(200).send({ status: 200, categories });
    } catch(err) {
      console.log('Error getCategories Query: ', err);
      return ctx.response.status(400).send({ error: 'An error occurred, check the api console.'});
    }
  }

  public async store(ctx: HttpContextContract) {
    try {
      await ctx.bouncer.with('DashboardPolicy').authorize('admin');

      const validator = await ctx.request.validate(StoreValidator);

      const account = ctx.auth.user;

      if (!account || !account.id) {
        return ctx.response.unauthorized();
      }

      const data = {
        name: validator.name,
        description: validator.description,
        hidden: 0,
        created_at: new Date()
      }

      await this.categoryRepository.create(data);

      return ctx.response.status(200).send({ status: 200, message: 'New Shop Category created successfully!'});
    } catch (err) {
      console.log('Error createNewShopCategory Query: ', err);
      return ctx.response.badRequest(err.messages);
    }
  }

  public async show(ctx: HttpContextContract) {
    try {
      await ctx.bouncer.with('DashboardPolicy').authorize('admin');

      const category = await this.categoryView.getCategoryById(ctx.request.param('id'));

      if (!category.length) {
        return ctx.response.status(404).send({ message: 'Category not found.' });
      }
      return ctx.response.status(200).send({ status: 200, category });
    } catch (err) {
      console.log('Error getCategory Query: ', err);
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

      await this.categoryRepository.update(data.category_id, data);
      
      return ctx.response.status(200).send({ status: 200, message: "Category successfully updated." });
    } catch (err) {
      console.log('Error updateShopCategory Query: ', err);
      return ctx.response.badRequest(err.messages);
    }
  }

  public async destroy(ctx: HttpContextContract) {
    try {
      await ctx.bouncer.with('DashboardPolicy').authorize('admin');

      const account = ctx.auth.user;

      if (!account || !account.id) {
        return ctx.response.unauthorized();
      }

      await this.categoryRepository.delete(ctx.request.param('id'));
      
      return ctx.response.status(200).send({ status: 200, message: "Category successfully deleted." });
    } catch (err) {
      console.log('Error deleteShopCategory Query: ', err);
      return ctx.response.badRequest(err.messages);
    }
  }
}
