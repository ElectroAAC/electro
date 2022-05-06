import BaseSchema from '@ioc:Adonis/Lucid/Schema'

export default class PlayerDeaths extends BaseSchema {
  protected tableName = 'player_deaths'

  public async up () {
    this.schema.createTable(this.tableName, (table) => {
      table
        .integer('player_id', 11)
        .references('id')
        .inTable('players')
        .unsigned()
        .onUpdate('CASCADE')
        .onDelete('CASCADE')
      table.bigInteger('time').unsigned().notNullable().defaultTo(0)
      table.integer('level').notNullable().defaultTo(1)
      table.string('killed_by').notNullable()
      table.tinyint('is_player', 1).notNullable().defaultTo(1)
      table.string('mostdamage_by', 100).notNullable()
      table.tinyint('mostdamage_is_player', 1).notNullable().defaultTo(0)
      table.tinyint('unjustified', 1).notNullable().defaultTo(0)
      table.tinyint('mostdamage_unjustified', 1).notNullable().defaultTo(0)
      table.integer('bless', 11).notNullable().defaultTo(0)
      table.integer('aol', 11).notNullable().defaultTo(0)
      table.timestamp('created_at', { useTz: true })
      table.timestamp('updated_at', { useTz: true })
    })
  }

  public async down () {
    this.schema.dropTable(this.tableName)
  }
}
