import BaseSchema from '@ioc:Adonis/Lucid/Schema'

export default class Guilds extends BaseSchema {
  protected tableName = 'guilds'

  public async up () {
    this.schema.createTable(this.tableName, (table) => {
      table.increments('id').primary()
      table.string('name', 255).unique().notNullable()
      table
        .integer('ownerid', 11)
        .references('id')
        .inTable('players')
        .unsigned()
        .onUpdate('CASCADE')
        .onDelete('CASCADE')
      table.integer('creationdata', 11).notNullable()
      table.string('motd', 255).notNullable().defaultTo('')
      table.text('description').notNullable()
      table.text('logo_name').notNullable().defaultTo('default.gif')
      table.timestamp('created_at', { useTz: true })
      table.timestamp('updated_at', { useTz: true })
    })
  }

  public async down () {
    this.schema.dropTable(this.tableName)
  }
}
