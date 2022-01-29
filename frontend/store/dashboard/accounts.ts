import {
  Module,
  VuexModule,
  Mutation,
  Action
} from 'vuex-module-decorators'

import { $axios } from '@/utils/nuxt-instance'

interface UpdatePayload {
  id?: number,
  name?: string,
  premdays?: number,
  email?: string,
  group_id?: number,
  web_flags?: number,
  premium_points?: number,
  key?: string
}

interface CharactersPayload {
  id: number,
	level: number,
	name: string,
	vocation: number
}

@Module({
  name: 'dashboard/accounts',
  stateFactory: true,
  namespaced: true
})

export default class Accounts extends VuexModule {
  private account = {
    id: undefined,
		name: undefined,
		premdays: undefined,
		email: undefined,
		group_id: undefined,
		web_flags: undefined,
		premium_points: undefined,
		key: undefined
  }

  private characters = [];

  public get $account() {
    return this.account;
  }

  public get $characters() {
    return this.characters;
  }
  
  @Mutation
  private UPDATE_ACCOUNT(this: any, payload: UpdatePayload) {
    this.account = Object.assign(this.account, payload);
  }
  
  @Mutation
  private UPDATE_CHARACTERS(this: any, payload: CharactersPayload[]) {
    this.characters = payload;
  }

  @Action
  public async find(name: string) {
    try {
      return await $axios.$get(`dashboard/account/${name}`)
        .then((response) => {
          if (response.status !== 200) 
            throw new Error(response);
          
          this.context.commit('UPDATE_ACCOUNT', {
            id: response.result.account[0].id,
            name: response.result.account[0].name,
            premdays: response.result.account[0].premdays,
            email: response.result.account[0].email,
            group_id: response.result.account[0].group_id,
            web_flags: response.result.account[0].web_flags,
            premium_points: response.result.account[0].premium_points,
            key: response.result.account[0].key
          });

          this.context.commit('UPDATE_CHARACTERS', response.result.characters);

          return {
            status: response.status,
            data: response.result.account
          };
        })
        .catch(({ response }) => {
          return {
            data: [],
            status: response
          };
        });
    } catch(err) {
      return err;
    }
  }

  @Action
  public async update(payload: UpdatePayload) {
    try {
      return await $axios.$post('dashboard/account', payload)
        .then((response) => {
          if (!response) 
            throw new Error(response);

          return response;
        })
        .catch(({ response }) => {
          return {
            data: response,
            status: response.status
          };
        });
    } catch(err) {
      return err;
    }
  }
}
