import Database from '@ioc:Adonis/Lucid/Database'
import Env from '@ioc:Adonis/Core/Env'
const fs = require('fs');
const xml2js = require('xml2js');

class CreatureView {
  async getCreatures(page: number, limit: number) {
    try {
      return await Database
        .from('electro_creatures')
        .orderBy('name', 'asc')
        .paginate(page, limit);
    } catch (err) {
      console.log(err);
      return err;
    }
  }
}

class Creature extends CreatureView {
  loadMonstersXml() {
    try {
      const jsonString = fs.readFileSync(`${Env.get('SERVER_PATH')}data/monster/monsters.xml`, 'utf8');
      let json: any = {};

      xml2js.parseString(jsonString, { mergeAttrs: true }, (err, result) => {
        if (err) {
          throw new Error('Error: Cannot load monsters.xml. File not found.');
        }

        json = JSON.parse(JSON.stringify(result, null, 4));
      });
      return json.monsters;
    }
    catch (err) {
      return 'Error: Cannot load monsters.xml. File not found.';
    }
  }
  
  loadCreatureXml(path: string) {
    try {
      const jsonString = fs.readFileSync(`${Env.get('SERVER_PATH')}data/monster/${path}`, 'utf8');
      let json: any = {};

      xml2js.parseString(jsonString, { mergeAttrs: true }, (err, result) => {
        if (err) {
          throw new Error('Error: Cannot load monsters.xml. File not found.');
        }

        json = JSON.parse(JSON.stringify(result, null, 4));
      });
      return json;
    }
    catch (err) {
      return 'Error: Cannot load monsters.xml. File not found.';
    }
  }
}

class CreatureRepository extends CreatureView {
  public async create(data: Object): Promise<Number> {
    try {
      return await Database.table('electro_creatures').returning('id').insert(data);
    } catch (err) {
      console.log(err);
      return err;
    }
  }
}

export { Creature, CreatureView, CreatureRepository}