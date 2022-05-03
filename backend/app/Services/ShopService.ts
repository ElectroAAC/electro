import Database from '@ioc:Adonis/Lucid/Database'

class ShopRepository {
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

export { ShopRepository }