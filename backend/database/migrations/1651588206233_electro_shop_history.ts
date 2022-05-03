import BaseSchema from '@ioc:Adonis/Lucid/Schema'

export default class ElectroShopHistory extends BaseSchema {
  protected tableName = 'electro_shop_history'

  public async up () {
    this.schema.createTable(this.tableName, (table) => {
      table.increments('id').primary()
      table
        .integer('communication_id')
        .references('id')
        .inTable('electro_shop_communications')
        .onUpdate('CASCADE')
        .onDelete('CASCADE')
        .unsigned()
      table
        .integer('from_account_id')
        .references('id')
        .inTable('accounts')
        .onUpdate('CASCADE')
        .onDelete('CASCADE')
      table.string('from_nick').defaultTo("")
      table
        .integer('to_account_id')
        .references('id')
        .inTable('accounts')
        .onUpdate('CASCADE')
        .onDelete('CASCADE')
      table
        .integer('to_player_id')
        .references('id')
        .inTable('players')
        .onUpdate('CASCADE')
        .onDelete('CASCADE')
      table.integer('price').notNullable()
      table
        .integer('offer_id')
        .references('id')
        .inTable('electro_shop_items')
        .onUpdate('CASCADE')
        .onDelete('CASCADE')
        .unsigned()
      table.string('status').defaultTo("")
      table.integer('trans_start').defaultTo(0)
      table.integer('trans_real').defaultTo(0)
      table.integer('is_pacc')
      table.timestamps(true, true)
    })
  }

  public async down () {
    this.schema.dropTable(this.tableName)
  }
}
