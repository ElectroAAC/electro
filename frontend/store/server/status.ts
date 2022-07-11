import {
  Module,
  VuexModule,
  Mutation,
  Action
} from 'vuex-module-decorators'

import { $axios } from '@/utils/nuxt-instance'

@Module({
  name: 'server/status',
  stateFactory: true,
  namespaced: true
})

export default class Status extends VuexModule {
  @Action
  public async getStatus() {
    try {
      return await $axios.$get('status')
        .then((response) => {
          
          if (!response) 
            throw new Error(response);

          return {
            status: response.status,
            serverStatus: response.serverStatus
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
