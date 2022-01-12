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

  public get $player() {
    return this.player;
  }

  @Mutation
  private UPDATE_PLAYER(player: Player) {
    this.player = player
  }

  @Action
  public async getPlayer(name: String) {
    try {
      await $axios.$get(`player/${name}`)
      .then((res) => {
        if (!res) 
          throw new Error("Failed to get player");

        this.context.commit('UPDATE_PLAYER', res.result[0]);

        return 200;
      })
      .catch(() => {
        this.context.commit('UPDATE_PLAYER', {});
        return 400;
      });
    return 200;
    } catch(err) {
      this.context.commit('UPDATE_PLAYER', {});
      return 400;
    }
  }
}
