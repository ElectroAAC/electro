import {
  Module,
  VuexModule,
  Mutation,
  Action
} from 'vuex-module-decorators'

import { $axios } from '@/utils/nuxt-instance'

@Module({
  name: 'creatures/main',
  stateFactory: true,
  namespaced: true
})

export default class Creatures extends VuexModule {
  @Action
  public async getCreatures() {
    try {
      return await $axios.$get('creatures')
        .then((response) => {
          
          if (!response) 
            throw new Error(response);

          return {
            data: response.data,
            status: response.status
          };
        })
        .catch(() => {
          return {
            data: 'Error',
            status: 'SEARCH_NOTFOUND',
            total: 0
          };
        });
    } catch(err) {
      return err;
    }
  }
}
