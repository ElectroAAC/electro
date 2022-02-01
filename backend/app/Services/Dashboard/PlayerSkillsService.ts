import Database from '@ioc:Adonis/Lucid/Database'

export default class PlayerSkillsService {  
  public async find(id: number): Promise<Object[]> {    
    return await Database.from('player_skills').select('*').where('player_id', '=', id);
  }
}