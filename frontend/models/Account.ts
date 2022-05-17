export interface Accounts {
	id: Number,
	name: String,
	email: String,
	password: String,
	type: Number,
	premium_points: Number
}

export interface CharactersAccount {
	id: Number,
	level: Number,
	name: String,
	vocation: Number
}

export interface CreateCharacter {
	name: String | null,
	sex: Number | null,
	vocation: Number | null
}