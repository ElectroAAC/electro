import BaseSchema from '@ioc:Adonis/Lucid/Schema'

export default class PlayerItems extends BaseSchema {
  protected tableName = 'player_items'

  public async up () {
    this.schema.createTable(this.tableName, (table) => {
      table
        .integer('player_id', 11)
        .references('id')
        .inTable('players')
        .unsigned()
        .onUpdate('CASCADE')
        .onDelete('CASCADE')
      table.integer('pid', 11).notNullable().defaultTo(0)
      table.integer('sid', 11).notNullable()
      table.integer('itemtype', 6).notNullable()
      table.integer('count', 5).notNullable().defaultTo(0)
      table.binary('attributes').notNullable()
      table.timestamp('created_at', { useTz: true })
      table.timestamp('updated_at', { useTz: true })
    })
  }

  public async down () {
    this.schema.dropTable(this.tableName)
  }
}
