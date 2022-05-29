import BaseSchema from '@ioc:Adonis/Lucid/Schema'

export default class ElectroCreatures extends BaseSchema {
  protected tableName = 'electro_creatures'

  public async up () {
    this.schema.createTable(this.tableName, (table) => {
      table.increments('id').primary()
      table.tinyint('hidden', 1)
      table.string('name', 255)
      table.integer('mana', 11)
      table.integer('health', 11)
      table.integer('experience', 11)
      table.integer('look_type', 11)
      table.integer('loot', 11)
      table.timestamp('created_at', { useTz: true })
      table.timestamp('updated_at', { useTz: true })
    })
  }

  public async down () {
    this.schema.dropTable(this.tableName)
  }
}
