import BaseSchema from '@ioc:Adonis/Lucid/Schema'

export default class GuildwarKills extends BaseSchema {
  protected tableName = 'guildwar_kills'

  public async up () {
    this.schema.createTable(this.tableName, (table) => {
      table.increments('id').primary()
      table.string('killer', 50).notNullable()
      table.string('target', 50).notNullable()
      table.integer('killerguild', 11).notNullable().defaultTo('0')
      table.integer('targetguild', 11).notNullable().defaultTo('0')
      table
        .integer('warid', 11)
        .references('id')
        .inTable('guild_wars')
        .unsigned()
        .onUpdate('CASCADE')
        .onDelete('CASCADE')
      table.bigInteger('time').notNullable()
      table.timestamp('created_at', { useTz: true })
      table.timestamp('updated_at', { useTz: true })
    })
  }

  public async down () {
    this.schema.dropTable(this.tableName)
  }
}
