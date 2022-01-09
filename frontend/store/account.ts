import {
  Module,
  VuexModule,
  Mutation,
  Action
} from 'vuex-module-decorators'

import { $axios } from '@/utils/nuxt-instance'

import { Accounts } from '@/models'

@Module({
  name: 'account',
  stateFactory: true,
  namespaced: true
})

export default class Account extends VuexModule {
  private account = {} as Accounts;

  public get $account() {
    return this.account;
  }

  @Mutation
  private UPDATE_ACCOUNT(account: Accounts) {
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
      .catch(() => {
        return 400;
      });
    return 200;
  }

  @Action
  async destroy() {
    this.context.commit('UPDATE_ACCOUNT', {});
  }
}
