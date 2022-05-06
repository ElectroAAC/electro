import BaseSchema from '@ioc:Adonis/Lucid/Schema'

export default class AccountViplist extends BaseSchema {
  protected tableName = 'account_viplist'

  public async up () {
    this.schema.createTable(this.tableName, (table) => {
      table
        .integer('account_id', 11)
        .references('id')
        .inTable('accounts')
        .onUpdate('CASCADE')
        .onDelete('CASCADE')
        .unsigned()
      table
        .integer('player_id', 11)
        .references('id')
        .inTable('players')
        .onUpdate('CASCADE')
        .onDelete('CASCADE')
        .unsigned()
      table.string('description', 128).notNullable().defaultTo('')
      table.timestamp('created_at', { useTz: true })
      table.timestamp('updated_at', { useTz: true })
    })
  }

  public async down () {
    this.schema.dropTable(this.tableName)
  }
}
