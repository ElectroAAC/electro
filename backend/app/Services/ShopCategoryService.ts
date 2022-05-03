import Database from '@ioc:Adonis/Lucid/Database'

class CategoryView {
  public async getCategories(): Promise<Object[]> {  
    try {
      return await Database
        .from('electro_shop_categories')
        .select('id', 'name', 'description', 'hidden')
        .orderBy('name', 'asc');
    } catch (err) {
      console.log(err);
      return err;
    }
  }
}

class CategoryRepository {
  public async create(data: object): Promise<Number> {  
    try {
      return await Database.table('electro_shop_categories').returning('id').insert(data);
    } catch (err) {
      console.log(err);
      return err;
    }
  }
}

export { CategoryView, CategoryRepository }