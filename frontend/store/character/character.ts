import {
  Module,
  VuexModule,
  Mutation,
  Action
} from 'vuex-module-decorators'

import { $axios } from '@/utils/nuxt-instance'

import { Player } from '@/models'

interface Payload {
  id: number
}

@Module({
  name: 'character/charater',
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
  public async getPlayer(data: Payload) {
    await $axios.$get('player/', { data })
      .then((res) => {
        if (!res) 
          throw new Error("Failed to get player");
        this.context.commit('UPDATE_PLAYER', res);

        return 200;
      })
      .catch(() => {
        return 400;
      });
    return 200;
  }
}
