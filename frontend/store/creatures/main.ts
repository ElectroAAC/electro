import {
  Module,
  VuexModule,
  Mutation,
  Action
} from 'vuex-module-decorators'

import { Paginate } from '@/models'
import { $axios } from '@/utils/nuxt-instance'

@Module({
  name: 'creatures/main',
  stateFactory: true,
  namespaced: true
})

export default class Creatures extends VuexModule {
  @Action
  public async getCreatures(payload: Paginate) {
    try {
      return await $axios.$get(`creatures/${payload.page}/${payload.limit}`)
        .then((response) => {
          
          if (!response) 
            throw new Error(response);

          return {
            data: response.data.data,
            status: response.status,
            total: response.data.meta.total
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
