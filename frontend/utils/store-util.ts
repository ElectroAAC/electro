import { Store } from 'vuex';
import { getModule } from 'vuex-module-decorators';

import Auth from '@/store/auth';
import Account from '@/store/account';

let auth: Auth;
let account: Account;

const initializeStores = (store: Store<any>) => {
  auth = getModule(Auth, store);
  account = getModule(Account, store);
};

export {
  initializeStores,
  auth,
  account
};