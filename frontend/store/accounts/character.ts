import {
  Module,
  VuexModule,
  Mutation,
  Action
} from 'vuex-module-decorators'

import { $axios } from '@/utils/nuxt-instance'

import { CreateCharacter } from '@/models'

interface CreatePayload {
	name: String,
	sex: Number,
	vocation: Number
  town_id?: Number
}

@Module({
  name: 'accounts/register',
  stateFactory: true,
  namespaced: true
})

export default class AccountRegister extends VuexModule {
  private character = {} as CreateCharacter;
  
  public get $character() {
    return this.character;
  }

  @Action
  public async create(payload: CreatePayload) {
    const status = await $axios.$post('accounts/create-character', payload)
      .then((res) => {
        if (!res) 
          throw new Error("Failed to create character");
        return 200;
      })
      .catch(() => {
        return 400;
      });
    return status;
  }
}
