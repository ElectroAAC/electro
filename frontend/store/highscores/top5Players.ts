import {
  Module,
  VuexModule,
  Mutation,
  Action
} from 'vuex-module-decorators'

import { $axios } from '@/utils/nuxt-instance'
import { Top5Players } from '~/models';

@Module({
  name: 'highscores/top5Players',
  stateFactory: true,
  namespaced: true
})

export default class Top5Players extends VuexModule {
  private highscores: Top5Players[] = [];

  public get $topRank(): Top5Players[] {
    return this.highscores;
  }

  @Mutation
  private UPDATE_RANK(highscores: any) {
    this.highscores = highscores;
  }

  @Action
  public async getTopRank() {
    try {
      await $axios.$get('highscores')
      .then((res) => {
        if (!res) 
          throw new Error("Failed to get top rank");
        
        this.context.commit('UPDATE_RANK', res.result);

        return 200;
      })
      .catch(() => {
        this.context.commit('UPDATE_RANK', []);
        return 400;
      });
    return 200;
    } catch(err) {
      this.context.commit('UPDATE_RANK', []);
      return 400;
    }
  }
}
