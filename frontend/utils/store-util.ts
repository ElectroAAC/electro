import { Store } from 'vuex';
import { getModule } from 'vuex-module-decorators';

import Auth from '@/store/auth';

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

let account: Account;
let accountRegister: AccountRegister;

let character: Character;

let highscores: Highscores;

const initializeStores = (store: Store<any>) => {
  auth = getModule(Auth, store);

  account = getModule(Account, store);
  accountRegister = getModule(AccountRegister, store);

  character = getModule(Character, store);
  highscores = getModule(Highscores, store);
};

export {
  initializeStores,
  auth,
  account,
  accountRegister,
  character,
  highscores
};