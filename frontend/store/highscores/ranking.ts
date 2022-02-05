import {
  Module,
  VuexModule,
  Mutation,
  Action
} from 'vuex-module-decorators'

import { $axios } from '@/utils/nuxt-instance'
import { Paginate } from '@/models'
@Module({
  name: 'highscores/ranking',
  stateFactory: true,
  namespaced: true
})

export default class Ranking extends VuexModule {
  private type = "";

  public get $type() {
    return this.type;
  }

  @Mutation
  private UPDATE_TYPE(type: string) {
    this.type = type;
  }

  @Action
  public setType(type: string) {
    this.context.commit('UPDATE_TYPE', type);
  }

  @Action
  public async getTopRank(payload: { page: number, limit: number, type: string}) {
    try {
      return await $axios.$get(`highscores/${payload.page}/${payload.limit}/${payload.type || "Experience"}`)
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
