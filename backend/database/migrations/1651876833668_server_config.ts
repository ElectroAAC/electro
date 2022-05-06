import BaseSchema from '@ioc:Adonis/Lucid/Schema'

export default class ServerConfig extends BaseSchema {
  protected tableName = 'server_config'

  public async up () {
    this.schema.createTable(this.tableName, (table) => {
      table.string('config', 50).notNullable()
      table.string('value', 256).notNullable().defaultTo('')
      table.timestamp('created_at', { useTz: true })
      table.timestamp('updated_at', { useTz: true })
    })
  }

  public async down () {
    this.schema.dropTable(this.tableName)
  }
}
