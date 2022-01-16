import {
  Module,
  VuexModule,
  Mutation,
  Action
} from 'vuex-module-decorators'

import { $axios } from '@/utils/nuxt-instance'

interface CreatePayload {
	name: String | null,
	sex: Number | null,
	vocation: Number | null
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
    vocation: 1
  };
  
  public get $character() {
    return this.character;
  }

  @Mutation
  private UPDATE(this: any, character: UpdatePayload) {
    this.character = Object.assign(this.character, character);
  }

  @Action
  public async create(payload: CreatePayload) {
    if (!payload.vocation) {
      payload.vocation = 1;
      console.log('Entrou aqui');
    }

    const status = await $axios.$post('accounts/create-character', payload)
      .then(( response ) => {
        if (response.status !== 200) 
          throw new Error("Failed to create character");
        return response;
      })
      .catch(({ response }) => {
        return {
          message: response.data.errors[0].message,
          status: response.status
        };
      });
    return status;
  }

  @Action
  public async update(payload: UpdatePayload) {
    this.context.commit('UPDATE', payload);
  }
}
