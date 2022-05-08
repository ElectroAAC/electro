import BaseSchema from '@ioc:Adonis/Lucid/Schema'

export default class ElectroKeys extends BaseSchema {
  protected tableName = 'electro_keys'

  public async up () {
    this.schema.createTable(this.tableName, (table) => {
      table.increments('id').primary()
      table.string('key').unique()
      table
        .integer('account_id')
        .references('id')
        .inTable('accounts')
        .unsigned()
        .onUpdate('CASCADE')
        .onDelete('CASCADE')
      table.timestamps(true, true)
    })
  }

  public async down () {
    this.schema.dropTable(this.tableName)
  }
}
