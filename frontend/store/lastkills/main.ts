import {
  Module,
  VuexModule,
  Action
} from 'vuex-module-decorators'

import { $axios } from '@/utils/nuxt-instance'
import { Paginate } from '@/models'

@Module({
  name: 'lastkills/main',
  stateFactory: true,
  namespaced: true
})

export default class Lastkills extends VuexModule {
  @Action
  public async getLastkills(payload: Paginate) {
    try {
      return await $axios.$post(`lastkills/${payload.page}/${payload.limit}`, { "remote_url": "http://localhost:3000/character" })
        .then((response) => {
          if (!response) 
            throw new Error(response);

          return {
            data: response.last_kills,
            status: response.status,
            total: response.total
          };
        })
        .catch(({ response }) => {
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
