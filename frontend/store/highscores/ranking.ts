import {
  Module,
  VuexModule,
  Mutation,
  Action
} from 'vuex-module-decorators'

import { $axios } from '@/utils/nuxt-instance'

interface RankingPayload {
  page: Number,
  limit: Number
}

@Module({
  name: 'highscores/ranking',
  stateFactory: true,
  namespaced: true
})

export default class Ranking extends VuexModule {
  @Action
  public async getTopRank(payload: RankingPayload) {
    try {
      return await $axios.$get(`highscores/${payload.page}/${payload.limit}`)
        .then((response) => {
          if (!response) 
            throw new Error(response);

          return {
            data: response.result.data,
            status: response.status,
            total: response.result.meta.total
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
