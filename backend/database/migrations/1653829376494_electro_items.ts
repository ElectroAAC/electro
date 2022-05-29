import BaseSchema from '@ioc:Adonis/Lucid/Schema'

export default class ElectroItems extends BaseSchema {
  protected tableName = 'electro_items'

  public async up () {
    this.schema.createTable(this.tableName, (table) => {
      table.increments('id').primary()
      table.integer('itemId', 11)
      table.string('name', 255)
      table.string('description', 255)
      table.string('armor', 11)
      table.string('slot', 25)
      table.string('weapon', 25)
      table.string('attack', 25)
      table.string('defense', 25)
      table.timestamp('created_at', { useTz: true })
      table.timestamp('updated_at', { useTz: true })
    })
  }

  public async down () {
    this.schema.dropTable(this.tableName)
  }
}
