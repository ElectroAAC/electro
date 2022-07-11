import BaseSchema from '@ioc:Adonis/Lucid/Schema'

export default class MarketOffers extends BaseSchema {
  protected tableName = 'market_offers'

  public async up () {
    this.schema.createTable(this.tableName, (table) => {
      table.increments('id')
      table
        .integer('player_id', 11)
        .references('id')
        .inTable('players')
        .onUpdate('CASCADE')
        .onDelete('CASCADE')
        .unsigned()
      table.tinyint('sale').notNullable().defaultTo(0)
      table.integer('itemtype').unsigned().notNullable()
      table.integer('amount').unsigned().notNullable()
      table.bigInteger('created').unsigned().notNullable()
      table.bigInteger('anonymous').unsigned().notNullable()
      table.bigInteger('price').unsigned().notNullable().defaultTo(0)
      table.timestamp('created_at', { useTz: true })
      table.timestamp('updated_at', { useTz: true })
    })
  }

  public async down () {
    this.schema.dropTable(this.tableName)
  }
}
