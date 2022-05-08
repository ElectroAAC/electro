import BaseSchema from '@ioc:Adonis/Lucid/Schema'

export default class IpBans extends BaseSchema {
  protected tableName = 'ip_bans'

  public async up () {
    this.schema.createTable(this.tableName, (table) => {
      table.integer('ip', 11).unsigned().notNullable()
      table.string('reason', 255).notNullable()
      table.bigInteger('banned_at').notNullable()
      table.bigInteger('expires_at').notNullable()
      table.integer('banned_by').notNullable()
      table.timestamp('created_at', { useTz: true })
      table.timestamp('updated_at', { useTz: true })
    })
  }

  public async down () {
    this.schema.dropTable(this.tableName)
  }
}
