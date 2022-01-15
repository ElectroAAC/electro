import { Store } from 'vuex';
import { getModule } from 'vuex-module-decorators';

import Auth from '@/store/auth';

import {
  Home as DashboardHome
} from '@/store/dashboard'

import {
  Account,
  Register as AccountRegister
} from '@/store/accounts'

import { 
  Character 
} from '~/store/character'

import { 
  Highscores 
} from '~/store/highscores'

let auth: Auth;

let dashboardHome: DashboardHome;

let account: Account;
let accountRegister: AccountRegister;

let character: Character;

let highscores: Highscores;

const initializeStores = (store: Store<any>) => {
  auth = getModule(Auth, store);

  // Store Dashboard
  dashboardHome = getModule(DashboardHome, store);

  // Store Accounts
  account = getModule(Account, store);
  accountRegister = getModule(AccountRegister, store);

  // Store Character
  character = getModule(Character, store);

  // Store Highscores
  highscores = getModule(Highscores, store);
};

export {
  initializeStores,
  dashboardHome,
  auth,
  account,
  accountRegister,
  character,
  highscores
};