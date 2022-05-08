import Database from '@ioc:Adonis/Lucid/Database'

class ShopCommunicationRepository {
  public async insert(data: object): Promise<Number> {  
    try {
      return await Database.table('electro_shop_communications').returning('id').insert(data);
    } catch (err) {
      console.log(err);
      return err;
    }
  }
}

export { ShopCommunicationRepository }