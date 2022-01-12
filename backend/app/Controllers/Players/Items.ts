import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import Database from '@ioc:Adonis/Lucid/Database'

export default class PlayerItemsController {
  public async show({ request, response }: HttpContextContract) {
    try {
      const items = await Database
        .from('player_items')
        .select('pid', 'itemtype')
        .where('player_id', request.param('id'))
        .andWhere('pid', '>', 0)
        .andWhere('pid', '<', 11);
      
      const empty_slots = ["", "no_helmet", "no_necklace", "no_backpack", "no_armor", "no_handright", "no_handleft", "no_legs", "no_boots", "no_ring", "no_ammo"];
      
      const equipment: Array<String> | Array<Number> = [];

      // It goes through the list of returned items, and added the item's id in the index of its slot,
      items.map(item => {
        equipment[item['pid']] = item['itemtype'];
      })
      
      // Checks if the item_id is empty or equal to 0, if true, adds the blank image referring to the slot the item is in.
      for(let i = 0; i <= 10; i++)
      {
        if(!equipment[i] || equipment[i] === 0)
          equipment[i] = empty_slots[i];
      }

      return response.status(200).send({ result: equipment});

    } catch(err) {
      console.log('Error getPlayerItems Query: ', err);
      return response.status(400).send({ message: 'An error occurred, check the api console.'})
    }
  }
}
