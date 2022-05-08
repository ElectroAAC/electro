import BaseSchema from '@ioc:Adonis/Lucid/Schema'

export default class Towns extends BaseSchema {
  protected tableName = 'towns'

  public async up () {
    this.schema.createTable(this.tableName, (table) => {
      table.increments('id').primary()
      table.string('name', 255).notNullable()
      table.integer('posx', 11).notNullable().defaultTo(0)
      table.integer('posy', 11).notNullable().defaultTo(0)
      table.integer('posz', 11).notNullable().defaultTo(0)
      table.timestamp('created_at', { useTz: true })
      table.timestamp('updated_at', { useTz: true })
    })
  }

  public async down () {
    this.schema.dropTable(this.tableName)
  }
}
