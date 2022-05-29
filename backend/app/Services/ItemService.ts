import Database from '@ioc:Adonis/Lucid/Database'
import Env from '@ioc:Adonis/Core/Env'
const fs = require('fs');
const xml2js = require('xml2js');

class ItemView {
  public async getItems(type: string): Promise<Object[]> {  
    try {
      if (type === 'all') {
        return await Database
          .from('electro_items')
          .select('*');
      }
      else {
        const slot = (type === 'shield' || type === 'sword' || type === 'distance' || type === 'club' || type === 'axe') ? 'weapon' : 'slot';
  
        return await Database
          .from('electro_items')
          .select('*')
          .where(slot, '=', type);
      }
    } catch (err) {
      console.log(err);
      return err;
    }
  }

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

class Item extends ItemView {
  public loadItemsXml() {
    try {
      const jsonString = fs.readFileSync(`${Env.get('SERVER_PATH')}data/items/items.xml`, 'utf8');
      let json: any = {};

      xml2js.parseString(jsonString, { mergeAttrs: true }, (err, result) => {
        if (err) {
          throw new Error('Error: Cannot load items.xml. File not found.');
        }

        json = JSON.parse(JSON.stringify(result, null, 4));
      });
      
      return json.items;
    }
    catch (err) {
      return 'Error: Cannot load items.xml. File not found.';
    }
  }
}

class ItemRepository extends ItemView {
  public async create(data: Object): Promise<Number> {
    try {
      return await Database.table('electro_items').returning('id').insert(data);
    } catch (err) {
      console.log(err);
      return err;
    }
  }
}

export { Item, ItemView, ItemRepository }