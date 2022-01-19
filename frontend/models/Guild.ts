export interface Guild {
  guild: {
    id: Number,
		name: String,
		ownerid: Number,
		creationdata: Number
  },
  guild_rank: {
    id: Number
  },
  guild_members: {
    level: Number,
		rank_name: String,
		id: Number,
		name: String
  }
}