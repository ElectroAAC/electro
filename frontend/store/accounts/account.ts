import {
  Module,
  VuexModule,
  Mutation,
  Action
} from 'vuex-module-decorators'

import { $axios } from '@/utils/nuxt-instance'

import { Accounts, CharactersAccount } from '@/models'

interface ChangeNamePayload {
  enabled: boolean,
  points: number
}

interface UpdatePayload {
  new_name: String | null,
  character_id: Number | null
}

interface DeletePayload {
  password: String | null,
  character_id: Number | null
}
@Module({
  name: 'accounts/account',
  stateFactory: true,
  namespaced: true
})

export default class Account extends VuexModule {
  private account = {} as Accounts;
  private characters: CharactersAccount[] = [];
  private changeName = {
    enabled: false,
    points: 0
  }

  private name = {
    new_name: null,
    character_id: null
  }

  private dataDeleteCharacter = {
    character_id: null,
    password: null
  }

  public get $account() {
    return this.account;
  }

  public get $characters() {
    return this.characters;
  }

  public get $changeName() {
    return this.changeName;
  }

  public get $newName() {
    return this.name;
  }

  public get $dataDeleteCharacter() {
    return this.dataDeleteCharacter;
  }

  @Mutation
  private UPDATE_ACCOUNT(account: Accounts) {
    this.account = account
  }

  @Mutation
  private UPDATE_CHARACTERS(characters: CharactersAccount[]) {
    this.characters = characters;
  }

  @Mutation
  private UPDATE_CHANGE_NAME(payload: ChangeNamePayload) {
    this.changeName = payload;
  }

  @Mutation
  private UPDATE_NEW_NAME(this: any, payload: UpdatePayload) {
    this.name = Object.assign(this.name, payload);
  }

  @Mutation
  private UPDATE_PASSWORD_DELETE(this: any, payload: UpdatePayload) {
    this.dataDeleteCharacter = Object.assign(this.dataDeleteCharacter, payload);
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
  public async getCharacters(account_id: Number) {
    try {
      await $axios.$get(`accounts/characters/${account_id}`)
        .then((res) => {
          if (!res) 
            throw new Error("Failed to get chracters to account");

          this.context.commit('UPDATE_CHARACTERS', res.result);

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
  public async getChangeNameStatus() {
    try {
      await $axios.$get('player/change-name')
        .then((response) => {
          if (!response) 
            throw new Error("Failed to get status to change name");

          this.context.commit('UPDATE_CHANGE_NAME', response);
        })
        .catch(() => {
          this.context.commit('UPDATE_CHANGE_NAME', {});
        });
      return 200;
    } catch(err) {
      this.context.commit('UPDATE_CHANGE_NAME', {});
      return 400;
    }
  }

  @Action
  public async setNewName(payload: UpdatePayload) {
    this.context.commit('UPDATE_NEW_NAME', payload);
  }

  @Action
  public async setPasswordToDelete(payload: DeletePayload) {
    this.context.commit('UPDATE_PASSWORD_DELETE', payload);
  }
  
  @Action
  public async changeNameCharacter(payload: UpdatePayload) {
    const status = await $axios.$post('player/change-name', payload)
      .then(( response ) => {
        if (response.status !== 200) 
          throw new Error("Failed to change name character");
        return response;
      })
      .catch(({ response }) => {
        return {
          message: response.data.message ? response.data.message : response.data.errors[0].message,
          status: response.status
        };
      });
    return status;
  }

  @Action
  public async deleteCharacter(payload: DeletePayload) {
    const status = await $axios.$post('player/delete', payload)
      .then(( response ) => {
        if (response.status !== 200) 
          throw new Error("Failed to delete character");
        return response;
      })
      .catch(({ response }) => {
        return {
          message: response.data.message ? response.data.message : response.data.errors[0].message,
          status: response.status
        };
      });
    return status;
  }
  @Action
  async destroy() {
    this.context.commit('UPDATE_ACCOUNT', {});
  }
}
