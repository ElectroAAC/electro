import { Store } from 'vuex';
import { getModule } from 'vuex-module-decorators';

import Auth from '@/store/auth';
import Account from '@/store/account';
import AccountRegister from '@/store/accounts/register';

let auth: Auth;
let account: Account;
let accountRegister: AccountRegister;

const initializeStores = (store: Store<any>) => {
  auth = getModule(Auth, store);
  account = getModule(Account, store);
  accountRegister = getModule(AccountRegister, store);
};

export {
  initializeStores,
  auth,
  account,
  accountRegister
};