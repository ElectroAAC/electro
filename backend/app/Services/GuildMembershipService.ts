import Database from '@ioc:Adonis/Lucid/Database'

class GuildMembershipView {}

class GuildMembership extends GuildMembershipView {}

class GuildMembershipRepository extends GuildMembershipView {
  public async insert(data: object): Promise<Number> {  
    try {
      return await Database.table('guild_membership').returning('id').insert(data);
    } catch (err) {
      console.log(err);
      return err;
    }
  }
}

export { GuildMembership, GuildMembershipView, GuildMembershipRepository}