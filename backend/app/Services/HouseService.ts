import Database from '@ioc:Adonis/Lucid/Database'

export default class HouseService {
  public async findByOwnerId(character_id: number): Promise<Object[]> {  
    try {
      return await Database.from('houses').select('id').where('owner', '=', character_id);
    } catch (err) {
      console.log(err);
      return err;
    }
  }
}