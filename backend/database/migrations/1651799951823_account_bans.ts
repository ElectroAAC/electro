import BaseSchema from '@ioc:Adonis/Lucid/Schema'

export default class AccountBans extends BaseSchema {
  protected tableName = 'account_bans'

  public async up () {
    this.schema.createTable(this.tableName, (table) => {
      table
        .integer('account_id', 11)
        .references('id')
        .inTable('accounts')
        .onUpdate('CASCADE')
        .onDelete('CASCADE')
        .unsigned()
      table.string('reason', 255).notNullable()
      table.bigInteger('banned_at').notNullable()
      table.bigInteger('expires_at').notNullable()
      table.integer('banned_by', 11).notNullable()
      table.timestamp('created_at', { useTz: true })
      table.timestamp('updated_at', { useTz: true })
    })
  }

  public async down () {
    this.schema.dropTable(this.tableName)
  }
}
