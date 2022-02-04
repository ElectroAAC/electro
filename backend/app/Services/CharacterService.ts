import Database from '@ioc:Adonis/Lucid/Database'

export default class CharacterService {
  public async findById(character_id: number): Promise<Object[]> {  
    try {
      return await Database
        .from('players')
        .select('*')
        .where('id', character_id);
    } catch (err) {
      console.log(err);
      return err;
    }
  }

  public async findByName(name: string): Promise<Object[]> {  
    try {
      name = name.replace(/%20/g, " ").replace(/'+'/g, " ").replace(/'/g, "").replace(/%27/g, "").replace(/-/g, "").replace(/"/g, "").replace(/%22/g, "");

      return await Database
        .from('players')
        .select('*')
        .where('name', name);
    } catch (err) {
      console.log(err);
      return err;
    }
  }

  public async findByIdAndAccount(character_id: number, account_id: number): Promise<Object[]> {  
    try {
      return await Database
        .from('players')
        .select('name', 'deleted', 'online')
        .where('id', '=', character_id)
        .andWhere('account_id', '=', account_id);
    } catch (err) {
      console.log(err);
      return err;
    }
  }

  public async getByAccount(account_id: number): Promise<Object[]> {  
    try {
      return await Database
        .from('players')
        .select('name', 'deleted', 'online')
        .where('account_id', '=', account_id);
    } catch (err) {
      console.log(err);
      return err;
    }
  }

  public async getItems(character_id: number): Promise<Object[]>  {
    try {
      return await Database.from('player_items').select('*').where('player_id', '=', character_id);
    } catch (err) {
      console.log(err);
      return err;
    }
  }

  public async checkSkillId(character_id: number, skill_id: number): Promise<Object[]> {
    try {
      return await Database.from('player_skills').select('skillid').where('player_id', '=', character_id).andWhere('skillid', '=', skill_id);
    } catch (err) {
      console.log(err);
      return err;
    }
  }

  public async create(newPlayer: Object): Promise<Number> {
    try {
      return await Database.table('players').returning('id').insert(newPlayer);
    } catch (err) {
      console.log(err);
      return err;
    }
  }

  public async insertSkill(character_id: number, skill_id: number, value: number = 10, count: number = 0): Promise<Number> {
    try {
      return await Database.table('player_skills').insert({
        player_id: character_id,
        skillid: skill_id,
        value: value,
        count: count
      });
    } catch (err) {
      console.log(err);
      return err;
    }
  }

  public async insertItems(character_id: number, pid: number, sid: number, itemtype: number, count: number, attributes: string): Promise<Number> {
    try {
      return await Database.table('player_skills').insert({
        player_id: character_id,
        pid,
        sid,
        itemtype,
        count,
        attributes
      });
    } catch (err) {
      console.log(err);
      return err;
    }
  }

  public async updateName(character_id: number, new_name: string): Promise<Object[]> {  
    try {
      return await Database.from('players').where('id', '=', character_id).update({ name: new_name });
    } catch (err) {
      console.log(err);
      return err;
    }
  }

  public async delete(character_id: number): Promise<Object[]> {
    try {
      return await Database.from('players').where('id', '=', character_id).update({ deleted: 1 });
    } catch (err) {
      console.log(err);
      return err;
    }
  }
}