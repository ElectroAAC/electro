import BaseSchema from '@ioc:Adonis/Lucid/Schema'

export default class ElectroNews extends BaseSchema {
  protected tableName = 'electro_news'

  public async up () {
    this.schema.createTable(this.tableName, (table) => {
      table.increments('id')
      table
        .integer('account_id')
        .references('id')
        .inTable('accounts')
        .onUpdate('CASCADE')
        .onDelete('CASCADE')
        .unsigned()
      table.string('title').notNullable()
      table.text('body', 'longtext').notNullable()
      table.integer('hidden').defaultTo(0)
      table.timestamps(true, true)
    })
  }

  public async down () {
    this.schema.dropTable(this.tableName)
  }
}
