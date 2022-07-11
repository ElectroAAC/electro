import BaseSchema from '@ioc:Adonis/Lucid/Schema'

export default class PlayerStoreinboxitems extends BaseSchema {
  protected tableName = 'player_storeinboxitems'

  public async up () {
    this.schema.createTable(this.tableName, (table) => {
      table
        .integer('player_id', 11)
        .references('id')
        .inTable('players')
        .onUpdate('CASCADE')
        .onDelete('CASCADE')
        .unsigned()
      table.integer('sid').notNullable()
      table.integer('pid').notNullable().defaultTo(0)
      table.integer('itemtype').unsigned().notNullable()
      table.integer('count').notNullable().defaultTo(0)
      table.binary('attributes').notNullable()
      table.timestamp('created_at', { useTz: true })
      table.timestamp('updated_at', { useTz: true })
    })
  }

  public async down () {
    this.schema.dropTable(this.tableName)
  }
}
