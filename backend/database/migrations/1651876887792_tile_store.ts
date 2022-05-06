import BaseSchema from '@ioc:Adonis/Lucid/Schema'

export default class TileStore extends BaseSchema {
  protected tableName = 'tile_store'

  public async up () {
    this.schema.createTable(this.tableName, (table) => {
      table
        .integer('house_id', 11)
        .references('id')
        .inTable('houses')
        .unsigned()
        .onUpdate('CASCADE')
        .onDelete('CASCADE')
      table.binary('value').notNullable()
      table.timestamp('created_at', { useTz: true })
      table.timestamp('updated_at', { useTz: true })
    })
  }

  public async down () {
    this.schema.dropTable(this.tableName)
  }
}
