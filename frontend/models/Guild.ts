export interface Guild {
  info: {
    id: Number,
		name: String,
    description: String,
		creation_data: Number,
		owner_id: Number,
    owner_name: String
  },
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
}