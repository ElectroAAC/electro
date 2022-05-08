import BaseSchema from '@ioc:Adonis/Lucid/Schema'

export default class PlayerDepotlockeritems extends BaseSchema {
  protected tableName = 'player_depotlockeritems'

  public async up () {
    this.schema.createTable(this.tableName, (table) => {
      table
        .integer('player_id', 11)
        .references('id')
        .inTable('players')
        .unsigned()
        .onUpdate('CASCADE')
        .onDelete('CASCADE')
      table.integer('sid', 11).notNullable().comment('any given range eg 0-100 will be reserved for depot lockers and all > 100 will be then normal items inside depots')
      table.integer('pid', 11).notNullable().defaultTo(0)
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
