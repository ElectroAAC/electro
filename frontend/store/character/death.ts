import {
  Module,
  VuexModule,
  Mutation,
  Action
} from 'vuex-module-decorators'

import { $axios } from '@/utils/nuxt-instance'

import { Death } from '@/models'

@Module({
  name: 'character/death',
  stateFactory: true,
  namespaced: true
})

export default class Deaths extends VuexModule {
  private deaths: Death[] = [];

  public get $deaths() {
    return this.deaths;
  }

  @Mutation
  private SET(deaths: Death[]) {
    this.deaths = deaths;
  }

  @Action
  public async getDeaths(character_id: Number) {
    try {
      await $axios.$post(`player/${character_id}/deaths`, {
        remote_url: process.env.REMOTE_URL + '/character'
      })
        .then((res) => {
          if (!res) 
            throw new Error("Failed to get player deaths");

          this.context.commit('SET', res.result);

          return 200;
        })
        .catch(() => {
          this.context.commit('SET', []);
          return 400;
        });
    } catch(err) {
      this.context.commit('SET', []);
      return 400;
    }
  }
}
