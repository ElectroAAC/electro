import Database from '@ioc:Adonis/Lucid/Database'

export default class ItemService {
  public async getCharacterEquipments(character_id: number): Promise<Object[]> {  
    try {
      return await Database
        .from('player_items')
        .select('pid', 'itemtype')
        .where('player_id', character_id)
        .andWhere('pid', '>', 0)
        .andWhere('pid', '<', 11);
    } catch (err) {
      console.log(err);
      return err;
    }
  }
}