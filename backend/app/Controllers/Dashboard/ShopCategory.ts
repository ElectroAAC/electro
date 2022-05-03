import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import { StoreValidator } from 'App/Validators/Shop/Category'
import { ShopCategoryView, ShopCategoryRepository } from 'App/Services';

export default class AccountsController {
  public categoryView: ShopCategoryView = new ShopCategoryView();
  public categoryRepository: ShopCategoryRepository = new ShopCategoryRepository();

  public async store(ctx: HttpContextContract) {
    try {
      await ctx.bouncer.with('DashboardPolicy').authorize('viewList');

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
}
