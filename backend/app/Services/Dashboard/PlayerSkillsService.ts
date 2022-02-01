import Database from '@ioc:Adonis/Lucid/Database';

export default class PlayerSkillsService {  
  public async find(id: number): Promise<Object[]> {    
    return await Database.from('player_skills').select('*').where('player_id', '=', id);
  }

  public async update(data: any): Promise<String> {
    try {
      for(let i = 0; i < 7; i++) {
        await Database.table('player_skills').insert({
          player_id: data.id,
          skillid: i,
          value: data[i].value,
          count: data[i].count
        });
      }
  
      return "Skills successfully updated.";
    } catch(err) {
      return err;
    }
  }
}