import Database from '@ioc:Adonis/Lucid/Database'

export default class DeathService {
  public async getDeathsByCharacterId(character_id: number): Promise<Object[]> {  
    try {
      return await Database
        .from('player_deaths')
        .select('id', 'date', 'level')
        .where('player_id', character_id)
        .orderBy('date', 'desc')
        .limit(10);
    } catch (err) {
      console.log(err);
      return err;
    }
  }

  public async getInfoDeathById(death_id: number): Promise<Object[]> {  
    try {
      return await Database
        .from('killers')
        .leftJoin('environment_killers', 'environment_killers.kill_id', '=', 'killers.id')
        .leftJoin('player_killers', 'player_killers.kill_id', '=', 'killers.id')
        .leftJoin('players', 'players.id', '=', 'player_killers.player_id')
        .select(
          'environment_killers.name as monster_name', 
          'players.name as player_name', 
          'players.deleted as player_exists',
        )
        .where('killers.death_id', death_id)
        .orderBy('killers.final_hit', 'desc')
        .orderBy('killers.id', 'asc')
        .limit(10);
    } catch (err) {
      console.log(err);
      return err;
    }
  }
}