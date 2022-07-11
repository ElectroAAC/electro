import {
  Module,
  VuexModule,
  Mutation,
  Action
} from 'vuex-module-decorators'

import { $axios } from '@/utils/nuxt-instance'

@Module({
  name: 'server/main',
  stateFactory: true,
  namespaced: true
})

export default class Server extends VuexModule {
  @Action
  public async getMaxPlayers() {
    try {
      return await $axios.$get('server/max-players')
        .then((response) => {
          
          if (!response) 
            throw new Error(response);

          return {
            status: response.status,
            maxPlayers: response.maxPlayers
          };
        })
        .catch(() => {
          return false;
        });
    } catch(err) {
      return err;
    }
  }
}
