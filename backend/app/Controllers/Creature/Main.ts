import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import {
  Creature,
  CreatureRepository
} from 'App/Services'

export default class PlayerSkillController {
  public creature: Creature = new Creature();
  public creatureRepository: CreatureRepository = new CreatureRepository();

  public async loadXml(ctx: HttpContextContract) {
    try {
      const creatures = await this.creature.loadMonstersXml();
      
      if (creatures.errno) {
        throw new Error('Error: Cannot load monsters.xml. File not found.')
      }
      
      for (let monster of creatures.monster) {
        const result = await this.creature.loadCreatureXml(monster.file[0]);
        
        const loots = result.monster.loot && result.monster.loot[0] && result.monster.loot[0].item ? result.monster.loot[0].item.map((item) => {
          return {
            id: item.id[0],
            countmax: item.countmax[0],
            chance: item.chance[0],
          }
        }) : "";
  
        await this.creatureRepository.create({
          hidden: 0,
          name: result.monster.name[0],
          mana: result.monster.manacost[0],
          health: result.monster.health[0].max[0],
          experience: result.monster.experience[0],
          look_type: result.monster.look[0].type[0],
          loot: JSON.stringify(loots)
        })
      }

      return ctx.response.status(200).send({ data: 'Monsters table updated successfully.' });
    } catch(err) {
      console.log('Error loadCreatureXml: ', err);
      return ctx.response.status(400).send({ message: 'An error occurred, check the api console.'})
    }
  }
}
