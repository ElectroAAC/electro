import BaseSchema from '@ioc:Adonis/Lucid/Schema'

export default class Accounts extends BaseSchema {
  protected tableName = 'accounts'

  public async up () {
    this.schema.createTable(this.tableName, (table) => {
      table.increments('id').primary()
      table.string('name', 32).unique().notNullable()
      table.string('password').notNullable()
      table.string('secret', 16)
      table.integer('type', 11).notNullable().defaultTo('0')
      table.integer('premdays', 11).notNullable().defaultTo('0')
      table.integer('lastday', 10).unsigned().notNullable().defaultTo('0')
      table.string('email', 255).notNullable().defaultTo('')
      table.string('key', 64).notNullable().defaultTo('')
      table.tinyint('blocked', 1).notNullable().defaultTo(0)
      table.integer('created', 11).notNullable().defaultTo(0)
      table.string('rlname', 255).notNullable().defaultTo('')
      table.string('location', 255).notNullable().defaultTo('')
      table.string('country', 3).notNullable().defaultTo('')
      table.integer('web_lastlogin', 11).notNullable().defaultTo(0)
      table.integer('web_flags', 11).notNullable().defaultTo(0)
      table.string('email_hash', 32).notNullable().defaultTo('')
      table.string('email_new', 255).notNullable().defaultTo('')
      table.integer('email_new_time', 11).notNullable().defaultTo(0)
      table.string('email_code', 255).notNullable().defaultTo('')
      table.integer('email_next', 11).notNullable().defaultTo(0)
      table.integer('premium_points', 11).notNullable().defaultTo(0)
      table.tinyint('email_verified', 1).notNullable().defaultTo(0)
      table.integer('creation', 11).notNullable().defaultTo(0)
      table.integer('vote', 11).notNullable().defaultTo(0)
      table.timestamps(true, true)
    })
  }

  public async down () {
    this.schema.dropTable(this.tableName)
  }
}
