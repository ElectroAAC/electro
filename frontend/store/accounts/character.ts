import {
  Module,
  VuexModule,
  Mutation,
  Action
} from 'vuex-module-decorators'

import { $axios } from '@/utils/nuxt-instance'

interface CreatePayload {
	name: String,
	sex: Number,
	vocation: Number
  town_id?: Number
}

interface UpdatePayload {
  name?: String,
  sex?: Number,
  vocation?: Number
}
@Module({
  name: 'accounts/character',
  stateFactory: true,
  namespaced: true
})

export default class CreateCharacter extends VuexModule {
  private character = {
    name: null,
    sex: null,
    vocation: null
  };
  
  public get $character() {
    return this.character;
  }

  @Mutation
  private UPDATE(this: any, character: UpdatePayload) {
    this.character = character
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

  @Action
  public async update(payload: UpdatePayload) {
    this.context.commit('UPDATE', payload);
  }
}
