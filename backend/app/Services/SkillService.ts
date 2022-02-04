import Database from '@ioc:Adonis/Lucid/Database'

export default class SkillService {
  public async getCharacterSkills(character_id: number): Promise<Object[]> {  
    try {
      return await Database
        .from('players')
        .join('player_skills', 'players.id', '=', 'player_skills.player_id')
        .select('player_skills.skillid', 'player_skills.value')
        .where('players.id', character_id)
        .andWhere('player_skills.skillid', '<>', 6);
    } catch (err) {
      console.log(err);
      return err;
    }
  }
}