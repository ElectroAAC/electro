export interface Player {
	id: Number,
  name: String,
	sex: Number,
	vocation: Number,
	level: Number,
	maglevel: Number,
	lastlogin: Number,
	healthmax: Number,
	manamax: Number,
	online: Number,
	created: Number,
	looktype: Number,
	lookaddons: Number,
	lookhead: Number,
	lookbody: Number,
	looklegs: Number,
	lookfeet: Number,
}

export interface Skill {
	skillid: Number,
	value: Number
}

export interface Storage {
	key: Number,
	value: Number
}

export interface Item {
  id: Number,
  slot: String
}

export interface Death {
	time: number,
	description: string
}