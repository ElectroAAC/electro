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
  name: 'dashboard/characters',
  stateFactory: true,
  namespaced: true
})

export default class Characters extends VuexModule {
  private characters = {
    id: undefined,
		name: undefined,
		premdays: undefined,
		email: undefined,
		group_id: undefined,
		web_flags: undefined,
		premium_points: undefined,
		key: undefined
  };

  public get $characters() {
    return this.characters;
  }
  
  @Mutation
  private UPDATE_CHARACTERS(this: any, payload: UpdatePayload) {
    this.characters = Object.assign(this.characters, payload);
  }

  @Action
  public async find(name: string) {
    try {
      return await $axios.$get(`dashboard/characters/${name}`)
        .then((response) => {
          if (response.status !== 200) 
            throw new Error(response);

          this.context.commit('UPDATE_CHARACTERS', response.result);

          return {
            status: response.status,
            data: response.result
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
}
