import BaseSchema from '@ioc:Adonis/Lucid/Schema'

export default class GuildInvites extends BaseSchema {
  protected tableName = 'guild_invites'

  public async up () {
    this.schema.createTable(this.tableName, (table) => {
      table
        .integer('player_id', 11)
        .references('id')
        .inTable('players')
        .unsigned()
        .onUpdate('CASCADE')
        .onDelete('CASCADE')
      table
        .integer('guild_id', 11)
        .references('id')
        .inTable('guilds')
        .unsigned()
        .onUpdate('CASCADE')
        .onDelete('CASCADE')
      table.timestamp('created_at', { useTz: true })
      table.timestamp('updated_at', { useTz: true })
    })
  }

  public async down () {
    this.schema.dropTable(this.tableName)
  }
}
