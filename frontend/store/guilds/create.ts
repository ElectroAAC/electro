import {
  Module,
  VuexModule,
  Mutation,
  Action
} from 'vuex-module-decorators'

import { $axios } from '@/utils/nuxt-instance'

interface CreatePayload {
  name: String,
  character_id: Number
}

@Module({
  name: 'guilds/create',
  stateFactory: true,
  namespaced: true
})

export default class CreateGuild extends VuexModule {
  @Action
  public async createGuild(payload: CreatePayload) {
    try {
      return await $axios.$post('guilds/create-guild', payload)
        .then((response) => {
          if (!response) 
            throw new Error(response);
          
          return response.status;
        })
        .catch(() => {
          return 'SEARCH_NOTFOUND';
        });
    } catch(err) {
      return err;
    }
  }
}
