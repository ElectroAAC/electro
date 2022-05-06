import BaseSeeder from '@ioc:Adonis/Lucid/Seeder'
import { Player } from 'App/Models'

export default class CharactersSampleSeeder extends BaseSeeder {
  public async run () {
    await Player.create({
      account_id: 1,
      name: "Character Sample",
      conditions: '0x',
      comment: ''
    })
  }
}
