import {
  Module,
  VuexModule,
  Mutation,
  Action
} from 'vuex-module-decorators'

import { $axios } from '@/utils/nuxt-instance'

import { Player } from '@/models'

@Module({
  name: 'character/player',
  stateFactory: true,
  namespaced: true
})

export default class Character extends VuexModule {
  private player = {} as Player;

  public get $info() {
    return this.player;
  }

  @Mutation
  private SET(player: Player) {
    this.player = player
  }

  @Action
  public async getPlayer(name: String) {
    try {
      await $axios.$get(`player/${name}`)
        .then((res) => {
          if (!res) 
            throw new Error("Failed to get player");

          this.context.commit('SET', res.result[0]);

          return 200;
        })
        .catch(() => {
          this.context.commit('SET', {});
          return 400;
        });
      return 200;
    } catch(err) {
      this.context.commit('SET', {});
      return 400;
    }
  }
}
