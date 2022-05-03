import BaseSchema from '@ioc:Adonis/Lucid/Schema'

export default class ElectroShopCommunications extends BaseSchema {
  protected tableName = 'electro_shop_communications'

  public async up () {
    this.schema.createTable(this.tableName, (table) => {
      table.increments('id').primary()
      table
        .integer('player_id')
        .references('id')
        .inTable('players')
        .onUpdate('CASCADE')
        .onDelete('CASCADE')
      table.string('type').notNullable()
      table.string('action').notNullable()
      table.string('itemId1').notNullable()
      table.string('count1').notNullable()
      table.string('itemId2').notNullable()
      table.string('count2').notNullable()
      table.string('category_name').notNullable()
      table.string('offer_name').notNullable()
      table.string('param7').notNullable()
      table.integer('delete_it').defaultTo(1)
      table.timestamps(true, true)
    })
  }

  public async down () {
    this.schema.dropTable(this.tableName)
  }
}
