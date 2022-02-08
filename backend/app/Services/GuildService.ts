import Database from '@ioc:Adonis/Lucid/Database'
import { Guild as GuildModel, Player } from 'App/Models';
import { Character, CharacterView } from 'App/Services'

class GuildView {
  public character: Character = new Character();
  public characterView: CharacterView = new CharacterView();

  public async getTotalGuilds(): Promise<Object[]> {  
    try {
      return await Database
        .from('guilds')
        .count('* as total');
    } catch (err) {
      console.log(err);
      return err;
    }
  }

  public async getGuildById(guild_id: number): Promise<Object[]> {  
    try {
      return await Database
        .from('guilds')
        .innerJoin('guild_ranks', 'guild_ranks.guild_id', 'guilds.id')
        .select('guild_ranks.id as rank_id')
        .where('guilds.id', '=', guild_id)
        .andWhere('guild_ranks.level', '=', 3);
    } catch (err) {
      console.log(err);
      return err;
    }
  }

  public async getGuildByName(name: string): Promise<Object[]> {  
    try {
      name = name.replace(/%20/g, " ").replace(/'+'/g, " ").replace(/'/g, "").replace(/%27/g, "").replace(/-/g, "").replace(/"/g, "").replace(/%22/g, "");

      return await Database
        .from('guilds')
        .innerJoin('players', 'players.id', 'guilds.ownerid')
        .select(
          'guilds.id', 
          'guilds.name', 
          'guilds.description', 
          'guilds.ownerid as owner_id', 
          'guilds.creationdata as creation_data',
          'players.name as owner_name',
        )
        .where('guilds.name', '=', name);
    } catch (err) {
      console.log(err);
      return err;
    }
  }

  public async getGuildRanks(guild_id: number): Promise<Object[]> {  
    try {
      return await Database
        .from('guild_ranks')
        .select('id', 'level')
        .where('guild_id', '=', guild_id)
        .orderBy('level', 'desc');
    } catch (err) {
      console.log(err);
      return err;
    }
  }

  public async getGuildMembers(guild_id: number): Promise<Object[]> {  
    try {
      return await Database.from('guilds')
        .innerJoin('guild_ranks', 'guild_ranks.guild_id', '=', 'guilds.id')
        .innerJoin('players', 'players.rank_id', 'guild_ranks.id')
        .select(
          'guild_ranks.level',
          'guild_ranks.id as rank_id',
          'guild_ranks.name as rank_name',
          'players.id',
          'players.name',
          'players.vocation',
          'players.level as player_level',
          'players.online'
        )
        .where('guilds.id', '=', guild_id)
        .orderBy('guild_ranks.level', 'desc');
    } catch (err) {
      console.log(err);
      return err;
    }
  }

  public async getGuilds(page: number, limit: number): Promise<Object[]> {  
    try {
      return await Database
        .from('guilds')
        .select('id', 'name', 'motd', 'logo_name', 'description')
        .paginate(page, limit);
    } catch (err) {
      console.log(err);
      return err;
    }
  }

  public async getOwner(guild_id: number): Promise<Object[]> {  
    try {
      return await Database
        .from('guilds')
        .innerJoin('players', 'players.id', 'guilds.ownerid')
        .select('players.id', 'players.name', 'players.account_id')
        .where('guilds.id', '=', guild_id);
    } catch (err) {
      console.log(err);
      return err;
    }
  }

  public async getCharactersWithGuild(account_id: number): Promise<Object[]> {  
    try {
      return await Database
        .from('players')
        .select('id', 'name')
        .where('account_id', '=', account_id)
        .andWhere('rank_id', '=', 0);
    } catch (err) {
      console.log(err);
      return err;
    }
  }
}

class Guild extends GuildView {
  public async isOwner(account_id: number, guild_id: number): Promise<Boolean> {  
    try {
      const owner = await this.getOwner(guild_id) as { account_id: number }[];
      return owner[0].account_id === account_id;
    } catch (err) {
      console.log(err);
      return err;
    }
  }
  
  public async isLeader(account_id: number, guild_id: number): Promise<Boolean> {  
    try {
      const characters_to_account = await this.characterView.getByAccount(account_id) as Player[];
      const guildRanks = await this.getGuildRanks(guild_id) as GuildModel[];
      const guilds = await this.getGuildById(guild_id) as GuildModel[];
      let guild_leader = false;

      for (let character of characters_to_account) {
        if (character.rank_id > 0) {
          for (let rank of guildRanks) {
            if (character.rank_id === rank.id) {
              if (guilds[0].ownerid = character.id) {
                guild_leader = true;
              }
            }
          }
        }
      };

      return guild_leader;
    } catch (err) {
      console.log(err);
      return err;
    }
  }

  public async passLeadership(guild_id: number, new_leader: number): Promise<Object[]> {  
    try {
      const guildRanks = await this.getGuildRanks(guild_id) as GuildModel[];

      await this.character.updateRankId(new_leader, guildRanks[0].id);
      
      return await Database.from('guilds').where('id', '=', guild_id).update({ ownerid: new_leader });
    } catch (err) {
      console.log(err);
      return err;
    }
  }

  public async updateDescription(guild_id: number, description: string): Promise<Object[]> {  
    try {
      return await Database.from('guilds').where('id', '=', guild_id).update({ description });
    } catch (err) {
      console.log(err);
      return err;
    }
  }

  public async updateMotd(guild_id: number, motd: string): Promise<Object[]> {  
    try {
      return await Database.from('guilds').where('id', '=', guild_id).update({ motd });
    } catch (err) {
      console.log(err);
      return err;
    }
  }
}

class GuildRepository extends GuildView {

  public async create(newGuild: object): Promise<Number> {  
    try {
      return await Database.table('guilds').returning('id').insert(newGuild);
    } catch (err) {
      console.log(err);
      return err;
    }
  }

  public async deleteRank(rank_id: number): Promise<Object> {  
    try {
      return await Database
        .from('guild_ranks')
        .where('id', rank_id)
        .delete();
    } catch (err) {
      console.log(err);
      return err;
    }
  }

  public async delete(guild_id: number): Promise<Object> {
    try {
      const guildMembers = await this.getGuildMembers(guild_id) as Player[];
      const guildRanks = await this.getGuildRanks(guild_id) as GuildModel[];

      for (let member of guildMembers) {
        await this.character.updateRankId(member.id, 0);
      }

      for (let rank of guildRanks) {
        await this.deleteRank(rank.id);
      }

      return await Database.from('guilds').where('id', guild_id).delete();
    } catch (err) {
      console.log(err);
      return err;
    }
  }
}

export { Guild, GuildView, GuildRepository}