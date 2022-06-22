import BaseSchema from '@ioc:Adonis/Lucid/Schema'

export default class AccountStorage extends BaseSchema {
  protected tableName = 'account_storage'

  public async up () {
    this.schema.createTable(this.tableName, (table) => {
      table
        .integer('account_id', 11)
        .references('id')
        .inTable('accounts')
        .onUpdate('CASCADE')
        .onDelete('CASCADE')
        .unsigned()
        .primary()
      table.integer('key').unsigned().notNullable()
      table.integer('value').notNullable()
      table.timestamp('created_at', { useTz: true })
      table.timestamp('updated_at', { useTz: true })
    })
  }

  public async down () {
    this.schema.dropTable(this.tableName)
  }
}
