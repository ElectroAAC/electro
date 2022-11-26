import BaseSchema from '@ioc:Adonis/Lucid/Schema'

export default class ElectroPixPayments extends BaseSchema {
  protected tableName = 'electro_pix_payments'

  public async up () {
    this.schema.createTable(this.tableName, (table) => {
      table.increments('id')
      table
        .integer('account_id', 11)
        .references('id')
        .inTable('accounts')
        .unsigned()
        .onUpdate('CASCADE')
        .onDelete('CASCADE')
      table.string('status')
      table.integer('value', 11)
      table.string('qrcode', 255)
      table.timestamps(true, true)
    })
  }

  public async down () {
    this.schema.dropTable(this.tableName)
  }
}
