import Env from '@ioc:Adonis/Core/Env'
const fs = require('fs');
const xml2js = require('xml2js');

class CreatureView {}

class Creature extends CreatureView {
  loadCreatureXml() {
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
      console.log('Error: Cannot load monsters.xml. File not found.');
      return 'Error: Cannot load monsters.xml. File not found.';
    }
  }
}

class CreatureRepository extends CreatureView {}

export { Creature, CreatureView, CreatureRepository}