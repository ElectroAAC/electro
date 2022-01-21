import {
  Module,
  VuexModule,
  Mutation,
  Action
} from 'vuex-module-decorators'

import { $axios } from '@/utils/nuxt-instance'

@Module({
  name: 'online/main',
  stateFactory: true,
  namespaced: true
})

export default class Online extends VuexModule {
  @Action
  public async getOnline() {
    try {
      return await $axios.$get('online')
        .then((response) => {
          
          if (!response) 
            throw new Error(response);

          return {
            data: response.result,
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
