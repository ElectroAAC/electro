import {
  Module,
  VuexModule,
  Mutation,
  Action
} from 'vuex-module-decorators'

import { $axios } from '@/utils/nuxt-instance'

interface CreatePayload {
	name: String,
	email: String,
	password: String
}

@Module({
  name: 'accounts/register',
  stateFactory: true,
  namespaced: true
})

export default class AccountRegister extends VuexModule {
  @Action
  public async create(payload: CreatePayload) {
    const status = await $axios.$post('accounts/register', payload)
      .then((res) => {
        if (!res) 
          throw new Error("Failed to create account");
        return 200;
      })
      .catch(() => {
        return 400;
      });
    return status;
  }
}
