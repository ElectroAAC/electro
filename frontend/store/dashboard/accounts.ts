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

  public get $account() {
    return this.account;
  }
  
  @Mutation
  private UPDATE_ACCOUNT(this: any, payload: UpdatePayload) {
    this.account = Object.assign(this.account, payload);
  }

  @Action
  public async findAccount(name: string) {
    try {
      return await $axios.$get(`dashboard/account/${name}`)
        .then((response) => {
          if (!response) 
            throw new Error(response);
          
          this.context.commit('UPDATE_ACCOUNT', {
            id: response.result[0].id,
            name: response.result[0].name,
            premdays: response.result[0].premdays,
            email: response.result[0].email,
            group_id: response.result[0].group_id,
            web_flags: response.result[0].web_flags,
            premium_points: response.result[0].premium_points,
            key: response.result[0].key
          });

          return {
            status: response.status,
            data: response.result[0]
          };
        })
        .catch(({ response }) => {
          return {
            message: response.data.message ? response.data.message : response.data.errors[0].message,
            status: response.status
          };
        });
    } catch(err) {
      return err;
    }
  }

  @Action
  public async updateAccount(payload: UpdatePayload) {
    try {
      return await $axios.$post('dashboard/account', payload)
        .then((response) => {
          if (!response) 
            throw new Error(response);

          return response;
        })
        .catch(({ response }) => {
          return {
            message: response.data.message ? response.data.message : response.data.errors[0].message,
            status: response.status
          };
        });
    } catch(err) {
      return err;
    }
  }
}
