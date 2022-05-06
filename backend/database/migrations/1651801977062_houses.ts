import BaseSchema from '@ioc:Adonis/Lucid/Schema'

export default class Houses extends BaseSchema {
  protected tableName = 'houses'

  public async up () {
    this.schema.createTable(this.tableName, (table) => {
      table.increments('id').primary()
      table.integer('owner', 11).notNullable()
      table.integer('paid', 10).unsigned().notNullable().defaultTo(0)
      table.integer('warnings', 11).notNullable().defaultTo(0)
      table.string('name', 255).notNullable()
      table.integer('rent', 11).notNullable().defaultTo(0)
      table.integer('town_id', 11).notNullable().defaultTo(0)
      table.integer('bid', 11).notNullable().defaultTo(0)
      table.integer('bid_end', 11).notNullable().defaultTo(0)
      table.integer('last_bid', 11).notNullable().defaultTo(0)
      table.integer('highest_bidder', 11).notNullable().defaultTo(0)
      table.integer('size', 11).notNullable().defaultTo(0)
      table.integer('beds', 11).notNullable().defaultTo(0)
      table.timestamp('created_at', { useTz: true })
      table.timestamp('updated_at', { useTz: true })
    })
  }

  public async down () {
    this.schema.dropTable(this.tableName)
  }
}
