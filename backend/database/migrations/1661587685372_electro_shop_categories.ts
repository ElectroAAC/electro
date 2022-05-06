import BaseSchema from '@ioc:Adonis/Lucid/Schema'

export default class ElectroShopCategories extends BaseSchema {
  protected tableName = 'electro_shop_categories'

  public async up () {
    this.schema.createTable(this.tableName, (table) => {
      table.increments('id').primary()
      table.string('name').unique()
      table.string('description').unique()
      table.integer('hidden').defaultTo(0)
      table.timestamps(true, true)
    })
  }

  public async down () {
    this.schema.dropTable(this.tableName)
  }
}
