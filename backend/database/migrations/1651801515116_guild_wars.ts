import BaseSchema from '@ioc:Adonis/Lucid/Schema'

export default class GuildWars extends BaseSchema {
  protected tableName = 'guild_wars'

  public async up () {
    this.schema.createTable(this.tableName, (table) => {
      table.increments('id').primary()
      table.integer('guild1', 11).notNullable().defaultTo(0)
      table.integer('guild2', 11).notNullable().defaultTo(0)
      table.string('name1', 255).notNullable()
      table.string('name2', 255).notNullable()
      table.tinyint('status', 2).notNullable().defaultTo(0)
      table.bigInteger('started').notNullable().defaultTo(0)
      table.bigInteger('ended').notNullable().defaultTo(0)
      table.timestamp('created_at', { useTz: true })
      table.timestamp('updated_at', { useTz: true })
    })
  }

  public async down () {
    this.schema.dropTable(this.tableName)
  }
}
