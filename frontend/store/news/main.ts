import {
  Module,
  VuexModule,
  Action
} from 'vuex-module-decorators'

import { $axios } from '@/utils/nuxt-instance'
import { Paginate } from '@/models'

@Module({
  name: 'news/main',
  stateFactory: true,
  namespaced: true
})

export default class News extends VuexModule {
  @Action
  public async getLastNews(payload: Paginate) {
    try {
      return await $axios.$get(`news/${payload.page}/${payload.limit}`)
        .then((response) => {
          if (!response) 
            throw new Error(response);

          return {
            data: response.news.data,
            status: response.status,
            total: response.news.total
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
