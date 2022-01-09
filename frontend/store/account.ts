import {
  Module,
  VuexModule,
  Mutation,
  Action
} from 'vuex-module-decorators'

import { $axios } from '@/utils/nuxt-instance'

type Account = Array<Object>

@Module({
  name: 'account',
  stateFactory: true,
  namespaced: true
})

export default class Accounts extends VuexModule {
  private account = {} as Account;

  public get $account() {
    return this.account;
  }

  @Mutation
  private UPDATE_ACCOUNT(account: Account) {
    this.account = account
  }

  @Action
  public async get() {
    await $axios.$get('accounts')
      .then((res) => {
        if (!res) 
          throw new Error("Failed to get account");
        this.context.commit('UPDATE_ACCOUNT', res);

        return 200;
      })
      .catch((err) => {
        // eslint-disable-next-line no-console
        console.log(err);
        return 400;
      });
    return 200;
  }

  @Action
  async destroy() {
    this.context.commit('UPDATE_ACCOUNT', {});
  }
}
