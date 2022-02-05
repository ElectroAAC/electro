import Database from '@ioc:Adonis/Lucid/Database'

export default class StorageService {
  public async getCharacterStorage(character_id: number, storage: string): Promise<Object[]> {  
    try {
      return await Database
        .from('player_storage')
        .select('player_storage.key', 'player_storage.value')
        .where('player_storage.player_id', character_id)
        .andWhere('player_storage.key', storage);
    } catch (err) {
      console.log(err);
      return err;
    }
  }
}