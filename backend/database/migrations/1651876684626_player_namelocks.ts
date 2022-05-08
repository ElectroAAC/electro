import BaseSchema from '@ioc:Adonis/Lucid/Schema'

export default class PlayerNamelocks extends BaseSchema {
  protected tableName = 'player_namelocks'

  public async up () {
    this.schema.createTable(this.tableName, (table) => {
      table
        .integer('player_id', 11)
        .references('id')
        .inTable('players')
        .unsigned()
        .onUpdate('CASCADE')
        .onDelete('CASCADE')
      table.string('reason', 255).notNullable()
      table.bigInteger('namelocked_at').notNullable()
      table.integer('namelocked_by', 11).notNullable()
      table.timestamp('created_at', { useTz: true })
      table.timestamp('updated_at', { useTz: true })
    })
  }

  public async down () {
    this.schema.dropTable(this.tableName)
  }
}
