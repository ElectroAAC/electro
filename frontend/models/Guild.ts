export interface Guild {
  info: {
    id: Number,
		name: String,
    description: String,
		creation_data: Number,
		owner_id: Number,
    owner_name: String
  },
  guild_leader: Boolean,
	guild_vice: Boolean,
	level_guild: Number,
	players_from_account_in_guild: Number[],
	players_from_account_ids: Number[],
  guild_rank: {
    id: Number
  }[],
  guild_members: {
    level: Number,
		rank_name: String,
		id: Number,
		name: String,
    vocation: Number,
    player_level: Number,
    online: Number
  }[];
  invites: {
    id: Number,
		name: String
  }[];
}