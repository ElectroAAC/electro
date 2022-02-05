import Database from '@ioc:Adonis/Lucid/Database'

class News {
}

class NewsView {
  public async findNewsById(news_id: number): Promise<Object[]> {  
    try {
      return await Database
        .from('electro_news')
        .select('*')
        .where('id', '=', news_id)
    } catch (err) {
      console.log(err);
      return err;
    }
  }
  public async getNews(page: number, limit: number): Promise<Object[]> {  
    try {
      return await Database
        .from('electro_news')
        .select('id', 'title', 'body', 'created_at')
        .where('hidden', '=', 0)
        .orderBy('created_at', 'desc')
        .paginate(page, limit);
    } catch (err) {
      console.log(err);
      return err;
    }
  }
}

class NewsRepository {
  public async create(news: Object): Promise<Object[]> {  
    try {
      return await Database.table('electro_news').returning('id').insert(news);
    } catch (err) {
      console.log(err);
      return err;
    }
  }

  public async update(news_id: number, data: any): Promise<Object[]> {  
    try {
      return await Database
        .from('electro_news')
        .where('id', '=', news_id)
        .update({ 
          title: data.title,
          body: data.description,
          hidden: data.hidden ? 1 : 0,
          updated_at: new Date()
        });
    } catch (err) {
      console.log(err);
      return err;
    }
  }
}

export { News, NewsRepository, NewsView };