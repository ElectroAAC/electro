import Database from '@ioc:Adonis/Lucid/Database'

export default class DeathService {
  public async getDeathsByCharacterId(character_id: number): Promise<Object[]> {  
    try {
      return await Database
        .from('player_deaths')
        .select('player_id', 'time', 'level', 'killed_by', 'is_player', 'mostdamage_by', 'mostdamage_is_player', 'unjustified', 'mostdamage_unjustified')
        .where('player_id', character_id)
        .orderBy('time', 'desc')
        .limit(10);
    } catch (err) {
      console.log(err);
      return err;
    }
  }

  public async getInfoDeathCharacterById(death_id: number): Promise<Object[]> {  
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

  public async getLastKills(page: number, limit: number): Promise<Object> {  
    try {
      return await Database
        .from('player_deaths')
        .innerJoin('players', 'players.id', 'player_deaths.player_id')
        .select('player_deaths.id', 'player_deaths.date', 'player_deaths.level', 'players.name')
        .orderBy('player_deaths.date', 'desc')
        .paginate(page, limit);
    } catch (err) {
      console.log(err);
      return err;
    }
  }

  public async getKillers(death_id: number): Promise<Object[]> {  
    try {
      return await Database
        .from('killers')
        .leftJoin('environment_killers', 'environment_killers.kill_id', 'killers.id')
        .leftJoin('player_killers', 'player_killers.kill_id', 'killers.id')
        .leftJoin('players', 'players.id', 'player_killers.player_id')
        .select('environment_killers.name AS monster_name', 'players.name AS player_name', 'players.deleted AS player_exists')
        .where('killers.death_id', '=', death_id)
        .orderBy('killers.final_hit', 'desc');
    } catch (err) {
      console.log(err);
      return err;
    }
  }
}