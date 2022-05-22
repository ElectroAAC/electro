import Database from '@ioc:Adonis/Lucid/Database'
import { ShopCategoryView } from 'App/Services'

class ShopItemView {
  public shopCategoryView: ShopCategoryView = new ShopCategoryView();

  public async getOfferById(id: number): Promise<Object[]> {  
    try {
      return await Database
        .from('electro_shop_items')
        .innerJoin('electro_shop_categories', 'electro_shop_categories.id', 'electro_shop_items.category_id')
        .select(
          'electro_shop_items.id', 
          'electro_shop_items.name', 
          'electro_shop_items.category_id', 
          'electro_shop_categories.name as category_name', 
          'electro_shop_items.description', 
          'electro_shop_items.price', 
          'electro_shop_items.itemId1', 
          'electro_shop_items.count1', 
          'electro_shop_items.itemId2', 
          'electro_shop_items.count2'
        )
        .where('electro_shop_items.id', '=', id);
    } catch (err) {
      console.log(err);
      return err;
    }
  }

  public async getOffers(category_name: String, page: number, limit: number): Promise<Object[]> {  
    try {
      const category: any = category_name ? await this.shopCategoryView.getCategoryByName(category_name) : "";
      
      if (category.length) {
        return await Database
          .from('electro_shop_items')
          .select('id', 'category_id', 'name', 'description', 'price', 'itemId1', 'count1', 'itemId2', 'count2', 'hidden')
          .where('category_id', '=', category[0].id)
          .orderBy('name', 'asc')
          .paginate(page, limit);
      }
      else {
        return await Database
          .from('electro_shop_items')
          .select('id', 'category_id', 'name', 'description', 'price', 'itemId1', 'count1', 'itemId2', 'count2', 'hidden')
          .orderBy('name', 'asc')
          .paginate(page, limit);
      }
    } catch (err) {
      console.log(err);
      return err;
    }
  }
}

class ShopItemRepository {
  public async create(data: object): Promise<Number> {  
    try {
      return await Database.table('electro_shop_items').returning('id').insert(data);
    } catch (err) {
      console.log(err);
      return err;
    }
  }

  public async update(offer_id: number, data: any): Promise<Object[]> {  
    try {
      return await Database
        .from('electro_shop_items')
        .where('id', '=', offer_id)
        .update(data);
    } catch (err) {
      console.log(err);
      return err;
    }
  }

  public async delete(offer_id: number): Promise<Object> {
    try {
      return await Database.from('electro_shop_items').where('id', offer_id).delete();
    } catch (err) {
      console.log(err);
      return err;
    }
  }
}

export { ShopItemView, ShopItemRepository }