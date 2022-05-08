import BaseSchema from '@ioc:Adonis/Lucid/Schema'

export default class GlobalStorage extends BaseSchema {
  protected tableName = 'global_storage'

  public async up () {
    this.schema.createTable(this.tableName, (table) => {
      table.string('key', 32).notNullable()
      table.string('value', 255)
      table.timestamp('created_at', { useTz: true })
      table.timestamp('updated_at', { useTz: true })
    })
  }

  public async down () {
    this.schema.dropTable(this.tableName)
  }
}
