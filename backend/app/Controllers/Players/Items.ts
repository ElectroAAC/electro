import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import { ItemService } from 'App/Services'

export default class PlayerItemsController {
  public itemService: ItemService = new ItemService();

  public async show(ctx: HttpContextContract) {
    try {
      const items = await this.itemService.getCharacterEquipments(ctx.request.param('id'));
      
      const empty_slots = ["", "no_helmet", "no_necklace", "no_backpack", "no_armor", "no_handright", "no_handleft", "no_legs", "no_boots", "no_ring", "no_ammo"];

      const name_slots = ['', 'helmet', 'necklace', 'backpack', 'armor', 'handright', 'handleft', 'legs', 'boots', 'ring', 'ammo'];
      
      const newOrder = [0, 2, 1, 3, 5, 4, 6, 8, 10, 7, 9];

      const equipment: Object[] = [];

      const newEquipment: Object[] = [];

      // It goes through the list of returned items, and added the item's id in the index of its slot,
      items.map(item => {
        equipment[item['pid']] = {
          id: item['itemtype'],
          slot: name_slots[item['pid']]
        };
      });
      
      // Checks if the item_id is empty or equal to 0, if true, adds the blank image referring to the slot the item is in.
      for(let i = 0; i <= 10; i++)
      {
        if(!equipment[i] || equipment[i] === 0)
          equipment[i] = {
            id: empty_slots[i],
            slot: name_slots[i]
          };
      }
      
      // Sort the equipments position to list in ascending order without disturbing the tibia pattern display order
      equipment.map((equip, idx) => {
        newEquipment[newOrder[idx]] = equip;
      })

      newEquipment.shift();

      return ctx.response.status(200).send({ result: newEquipment});
    } catch(err) {
      console.log('Error getPlayerItems Query: ', err);
      return ctx.response.status(400).send({ message: 'An error occurred, check the api console.'})
    }
  }
}
