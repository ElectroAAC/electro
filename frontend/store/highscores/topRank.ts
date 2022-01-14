import {
  Module,
  VuexModule,
  Mutation,
  Action
} from 'vuex-module-decorators'

import { $axios } from '@/utils/nuxt-instance'
import { HighscoresWidget } from '~/models';

@Module({
  name: 'highscores/topRank',
  stateFactory: true,
  namespaced: true
})

export default class Highscores extends VuexModule {
  private highscores: HighscoresWidget[] = [];

  public get $topRank(): HighscoresWidget[] {
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
