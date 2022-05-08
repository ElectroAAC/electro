import Database from '@ioc:Adonis/Lucid/Database'

class GuildRanksView {}

class GuildRanks extends GuildRanksView {}

class GuildRanksRepository extends GuildRanksView {
  public async create(newRank: object): Promise<Number> {  
    try {
      return await Database.table('guild_ranks').returning('id').insert(newRank);
    } catch (err) {
      console.log(err);
      return err;
    }
  }
}

export { GuildRanks, GuildRanksView, GuildRanksRepository}