import BaseSchema from '@ioc:Adonis/Lucid/Schema'

export default class ElectroShopItems extends BaseSchema {
  protected tableName = 'electro_shop_items'

  public async up () {
    this.schema.createTable(this.tableName, (table) => {
      table.increments('id').primary()
      table
        .integer('category_id')
        .references('id')
        .inTable('electro_shop_categories')
        .onUpdate('CASCADE')
        .onDelete('CASCADE')
        .unsigned()
      table.string('name').unique().notNullable()
      table.string('description').notNullable()
      table.integer('price').notNullable()
      table.integer('itemId1').notNullable()
      table.integer('count1').notNullable()
      table.integer('itemId2').defaultTo(0)
      table.integer('count2').defaultTo(0)
      table.integer('hidden').defaultTo(0)
      table.timestamps(true, true)
    })
  }

  public async down () {
    this.schema.dropTable(this.tableName)
  }
}
