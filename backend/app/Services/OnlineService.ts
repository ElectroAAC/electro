import Database from '@ioc:Adonis/Lucid/Database'

export default class OnlineService {
  public async getPlayersOnline(): Promise<Object[]> {  
    try {
      return await Database
        .from('players')
        .innerJoin('accounts', 'accounts.id', 'players.account_id')
        .select('accounts.country', 'players.skull', 'players.skulltime', 'players.name', 'players.level', 'players.vocation')
        .where('players.online', '>', '0')
        .orderBy('experience', 'desc');
    } catch (err) {
      console.log(err);
      return err;
    }
  }

  public async getRecord(world_id): Promise<Object[]> {  
    try {
      return await Database
        .from('server_record')
        .select('record', 'timestamp')
        .where('world_id', '=', world_id)
        .orderBy('record', 'desc')
        .limit(1);
    } catch (err) {
      console.log(err);
      return err;
    }
  }
}