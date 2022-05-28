import Database from '@ioc:Adonis/Lucid/Database'

export default class OnlineService {
  public async getPlayersOnline(): Promise<Object[]> {  
    try {
      return await Database
        .from('players_online as po')
        .innerJoin('players as p', 'p.id', 'po.player_id')
        .innerJoin('accounts as a', 'a.id', 'p.account_id')
        .select('a.country', 'p.name', 'p.level', 'p.vocation', 'p.lookhead', 'p.lookbody', 'p.looklegs', 'p.lookfeet', 'p.looktype', 'p.lookaddons')
        .orderBy('p.experience', 'desc');
    } catch (err) {
      console.log(err);
      return err;
    }
  }

  public async getRecord(): Promise<Object[]> {  
    try {
      return await Database
        .from('server_config')
        .select('value as record')
        .where('config', '=', 'players_record')
        .orderBy('record', 'desc')
    } catch (err) {
      console.log(err);
      return err;
    }
  }
}