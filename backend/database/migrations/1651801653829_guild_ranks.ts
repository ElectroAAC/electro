import BaseSchema from '@ioc:Adonis/Lucid/Schema'

export default class GuildRanks extends BaseSchema {
  protected tableName = 'guild_ranks'

  public async up () {
    this.schema.createTable(this.tableName, (table) => {
      table.increments('id').primary()
      table
        .integer('guild_id', 11)
        .references('id')
        .inTable('guilds')
        .unsigned()
        .comment('guild')
        .onUpdate('CASCADE')
        .onDelete('CASCADE')
      table.string('name', 255).notNullable().comment('rank name')
      table.integer('level', 11).notNullable().comment('rank level - leader, vice, member, maybe something else')
      table.timestamp('created_at', { useTz: true })
      table.timestamp('updated_at', { useTz: true })
    })
  }

  public async down () {
    this.schema.dropTable(this.tableName)
  }
}
