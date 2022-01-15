import {
  Module,
  VuexModule,
  Mutation,
  Action
} from 'vuex-module-decorators'

import { $axios } from '@/utils/nuxt-instance'

import { Accounts, CharactersAccount } from '@/models'

@Module({
  name: 'accounts/account',
  stateFactory: true,
  namespaced: true
})

export default class Account extends VuexModule {
  private account = {} as Accounts;
  private characters: CharactersAccount[] = [];

  public get $account() {
    return this.account;
  }

  public get $characters() {
    return this.characters;
  }

  @Mutation
  private UPDATE_ACCOUNT(account: Accounts) {
    this.account = account
  }

  @Mutation
  private UPDATE_CHARACTERS(characters: CharactersAccount[]) {
    this.characters = characters;
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
  async getCharacters(account_id: number) {
    try {
      await $axios.$get(`accounts/characters/${account_id}`)
        .then((res) => {
          if (!res) 
            throw new Error("Failed to get chracters to account");

          this.context.commit('UPDATE_CHARACTERS', res.result[0]);

          return 200;
        })
        .catch(() => {
          this.context.commit('UPDATE_CHARACTERS', {});
          return 400;
        });
      return 200;
    } catch(err) {
      this.context.commit('UPDATE_CHARACTERS', {});
      return 400;
    }
  }

  @Action
  async destroy() {
    this.context.commit('UPDATE_ACCOUNT', {});
  }
}
