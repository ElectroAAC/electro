import Database from '@ioc:Adonis/Lucid/Database'

export default class NewsService {
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