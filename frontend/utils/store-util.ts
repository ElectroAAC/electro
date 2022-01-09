import { Store } from 'vuex';
import { getModule } from 'vuex-module-decorators';

import Auth from '@/store/auth';
import Accounts from '@/store/account';

let auth: Auth;
let account: Accounts;

const initializeStores = (store: Store<any>) => {
  auth = getModule(Auth, store);
  account = getModule(Accounts, store);
};

export {
  initializeStores,
  auth,
  account
};