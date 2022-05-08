import BaseSchema from '@ioc:Adonis/Lucid/Schema'

export default class PlayerStorage extends BaseSchema {
  protected tableName = 'player_storage'

  public async up () {
    this.schema.createTable(this.tableName, (table) => {
      table
        .integer('player_id', 11)
        .references('id')
        .inTable('players')
        .unsigned()
        .onUpdate('CASCADE')
        .onDelete('CASCADE')
      table.integer('key', 10).unsigned().notNullable()
      table.integer('value', 11).notNullable().defaultTo(0)
      table.timestamp('created_at', { useTz: true })
      table.timestamp('updated_at', { useTz: true })
    })
  }

  public async down () {
    this.schema.dropTable(this.tableName)
  }
}
