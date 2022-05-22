import Database from '@ioc:Adonis/Lucid/Database'

class CategoryView {
  public async getCategories(page: number, limit: number): Promise<Object[]> {  
    try {
      return await Database
        .from('electro_shop_categories')
        .select('id', 'name', 'description', 'hidden')
        .orderBy('name', 'asc')
        .paginate(page, limit);
    } catch (err) {
      console.log(err);
      return err;
    }
  }
  public async getCategoryByName(name): Promise<Object[]> {  
    try {
      return await Database
        .from('electro_shop_categories')
        .select('id', 'name', 'description', 'hidden')
        .where('name', '=', name)
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

  public async update(category_id: number, data: any): Promise<Object[]> {  
    try {
      return await Database
        .from('electro_shop_categories')
        .where('id', '=', category_id)
        .update({ 
          name: data.name,
          description: data.description,
          hidden: data.hidden ? 1 : 0,
          updated_at: new Date()
        });
    } catch (err) {
      console.log(err);
      return err;
    }
  }

  public async delete(category_id: number): Promise<Object> {
    try {
      return await Database.from('electro_shop_categories').where('id', category_id).delete();
    } catch (err) {
      console.log(err);
      return err;
    }
  }
}

export { CategoryView, CategoryRepository }