import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import {
  Item,
  ItemView,
  ItemRepository
} from 'App/Services'

export default class PlayerSkillController {
  public item: Item = new Item();
  public itemRepository: ItemRepository = new ItemRepository();
  public itemView: ItemView = new ItemView();

  public async loadXml(ctx: HttpContextContract) {
    try {
      await ctx.bouncer.with('DashboardPolicy').authorize('admin');
      
      const itemsXML = await this.item.loadItemsXml();
      
      if (itemsXML.errno) {
        throw new Error('Error: Cannot load items.xml. File not found.')
      }
      
      // Only add equippable items
      for (let itemXML of itemsXML.item) {
        if (itemXML.id && itemXML.name && itemXML.attribute && itemXML.attribute.length) {

          if (!itemXML.id[0].includes(";")) {
            const armor = itemXML.attribute ? itemXML.attribute.find((attribute) => attribute.key[0] === "armor")?.value[0] : "";
            const slotType = itemXML.attribute ? itemXML.attribute.find((attribute) => attribute.key[0] === "slotType")?.value[0] : "";
            const description = itemXML.attribute ? itemXML.attribute.find((attribute) => attribute.key[0] === "description")?.value[0] : "";
            const weaponType = itemXML.attribute ? itemXML.attribute.find((attribute) => attribute.key[0] === "weaponType")?.value[0] : "";
            const attack = itemXML.attribute ? itemXML.attribute.find((attribute) => attribute.key[0] === "attack")?.value[0] : "";
            const defense = itemXML.attribute ? itemXML.attribute.find((attribute) => attribute.key[0] === "defense")?.value[0] : "";
            
            await this.itemRepository.create({
              itemId: itemXML.id[0],
              name: itemXML.name[0],
              description,
              armor,
              slot: slotType,
              weapon: weaponType,
              attack,
              defense
            });
          }
        }
      }

      return ctx.response.status(200).send({ data: itemsXML });
    } catch(err) {
      console.log('Error loadItemsXml: ', err);
      return ctx.response.status(400).send({ message: 'An error occurred, check the api console.'})
    }
  }

  public async show(ctx: HttpContextContract) {
    try {
      const items = await this.itemView.getItems(ctx.request.param('type'));

      return ctx.response.status(200).send({ status: 200, data: items });
    } catch(err) {
      console.log('Error getCreatures Query: ', err);
      return ctx.response.status(400).send({ error: 'An error occurred, check the api console.'});
    }
  }
}
