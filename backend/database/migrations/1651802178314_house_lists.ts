import BaseSchema from '@ioc:Adonis/Lucid/Schema'

export default class HouseLists extends BaseSchema {
  protected tableName = 'house_lists'

  public async up () {
    this.schema.createTable(this.tableName, (table) => {
      table
        .integer('house_lists', 11)
        .references('id')
        .inTable('houses')
        .unsigned()
        .comment('guild')
        .onUpdate('CASCADE')
        .onDelete('CASCADE')
      table.integer('listid', 11).notNullable()
      table.text('list').notNullable()
      table.timestamp('created_at', { useTz: true })
      table.timestamp('updated_at', { useTz: true })
    })
  }

  public async down () {
    this.schema.dropTable(this.tableName)
  }
}
