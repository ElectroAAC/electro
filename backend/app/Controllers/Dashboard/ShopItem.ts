import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import { StoreValidator, UpdateValidator } from 'App/Validators/Shop/Item'
import { ShopItemRepository, ShopItemView} from 'App/Services';

export default class AccountsController {
  public shopItemView: ShopItemView = new ShopItemView();
  public shopItemRepository: ShopItemRepository = new ShopItemRepository();

  public async index(ctx: HttpContextContract) {
    try {
      const items = await this.shopItemView.getShopItems();
      
      return ctx.response.status(200).send({ status: 200, items });
    } catch(err) {
      console.log('Error getShopItems Query: ', err);
      return ctx.response.status(400).send({ error: 'An error occurred, check the api console.'});
    }
  }

  public async store(ctx: HttpContextContract) {
    try {
      await ctx.bouncer.with('DashboardPolicy').authorize('viewList');

      const validator = await ctx.request.validate(StoreValidator);

      const account = ctx.auth.user;

      if (!account || !account.id) {
        return ctx.response.unauthorized();
      }

      await this.shopItemRepository.create(validator);

      return ctx.response.status(200).send({ status: 200, message: 'New Shop Offer created successfully!'});
    } catch (err) {
      console.log('Error createNewShopOffer Query: ', err);
      return ctx.response.badRequest(err.messages);
    }
  }

  public async update(ctx: HttpContextContract) {
    try {
      await ctx.bouncer.with('DashboardPolicy').authorize('viewList');

      const data = await ctx.request.validate(UpdateValidator);

      const account = ctx.auth.user;

      if (!account || !account.id) {
        return ctx.response.unauthorized();
      }

      await this.shopItemRepository.update(data.offer_id, data);
      
      return ctx.response.status(200).send({ status: 200, message: "Offer successfully updated." });
    } catch (err) {
      console.log('Error updateShopOffer Query: ', err);
      return ctx.response.badRequest(err.messages);
    }
  }

  public async destroy(ctx: HttpContextContract) {
    try {
      await ctx.bouncer.with('DashboardPolicy').authorize('viewList');

      const account = ctx.auth.user;

      if (!account || !account.id) {
        return ctx.response.unauthorized();
      }

      await this.shopItemRepository.delete(ctx.request.param('id'));
      
      return ctx.response.status(200).send({ status: 200, message: "Offer successfully deleted." });
    } catch (err) {
      console.log('Error deleteShopOffer Query: ', err);
      return ctx.response.badRequest(err.messages);
    }
  }
}
