import Database from '@ioc:Adonis/Lucid/Database';

export default class PlayerSkillsService {  
  public async find(id: number): Promise<Object[]> {    
    return await Database.from('player_skills').select('*').where('player_id', '=', id);
  }

  public async update(data: any): Promise<String> {
    try {
      for(let i = 0; i < 7; i++) {
        await Database.from('player_skills').where('player_id', '=', data.id).andWhere('skillid', '=', data.skills[i].skillid).update({
          skillid: i,
          value: data.skills[i].value,
          count: data.skills[i].count
        });
      }
  
      return "Skills successfully updated.";
    } catch(err) {
      console.log('Entrou aqui, 21: ', err);
      return err;
    }
  }
}