import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import { 
  ShopCategoryView
} from 'App/Services'

export default class ShopController {
  public shopCategory: ShopCategoryView = new ShopCategoryView();

  public async show(ctx: HttpContextContract) {
    try {
      const categories = await this.shopCategory.getCategories();

      return ctx.response.status(200).send({ result: categories});
    } catch (err) {
      console.log('Error getCategories: ', err);
      return ctx.response.status(400).send({ message: 'Categories not found.'})
    }
  }
}
