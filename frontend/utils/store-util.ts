import { Store } from 'vuex';
import { getModule } from 'vuex-module-decorators';

import Auth from '@/store/auth';

import {
  Home as DashboardHome
} from '@/store/dashboard'

import {
  Account,
  Register as AccountRegister,
  Character as CreateCharacter
} from '@/store/accounts'

import { 
  Character 
} from '~/store/character'

import { 
  Top5Players,
  Ranking
} from '~/store/highscores'

import {
  Guilds
} from '~/store/guilds'

let auth: Auth;

let dashboardHome: DashboardHome;

let account: Account;
let accountRegister: AccountRegister;
let createCharacter: CreateCharacter;

let character: Character;

let top5Players: Top5Players;
let ranking: Ranking;

let guilds: Guilds;

const initializeStores = (store: Store<any>) => {
  auth = getModule(Auth, store);

  // Store Dashboard
  dashboardHome = getModule(DashboardHome, store);

  // Store Accounts
  account = getModule(Account, store);
  accountRegister = getModule(AccountRegister, store);
  createCharacter = getModule(CreateCharacter, store);

  // Store Character
  character = getModule(Character, store);

  // Store Top5Players
  top5Players = getModule(Top5Players, store);
  ranking = getModule(Ranking, store);

  // Store Guilds
  guilds = getModule(Guilds, store);
};

export {
  initializeStores,
  dashboardHome,
  auth,
  account,
  accountRegister,
  createCharacter,
  character,
  top5Players,
  ranking,
  guilds
};