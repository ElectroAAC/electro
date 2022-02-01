import Database from '@ioc:Adonis/Lucid/Database'

export default class PlayerService {

  public async index(): Promise<Object[]> {
    return await Database.from('players').count('* as total');
  }
  
  public async find(name: string): Promise<Object[]> {    
    return await Database.from('players').select('*').where('name', '=', name);
  }

  public async update(data: { id: number, name: string }) {
    const character = await Database
      .from('players')
      .select('id')
      .where('name', '=', data.name)
      .andWhere('id', '<>', data.id);
    
    if (character.length)
      return "Error. The username is already used.";
      
    const affectedRows = await Database.from('players').where('id', '=', data.id).update(data);

    if (!affectedRows)
      return "Character not found.";
    
    return "Character successfully updated.";
  }

}