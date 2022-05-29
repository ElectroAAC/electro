import {
  Module,
  VuexModule,
  Mutation,
  Action
} from 'vuex-module-decorators'

import { $axios } from '@/utils/nuxt-instance'

import { CharacterItem } from '@/models'

@Module({
  name: 'character/items',
  stateFactory: true,
  namespaced: true
})

export default class Items extends VuexModule {
  private items: CharacterItem[] = [];

  public get $items() {
    return this.items;
  }

  @Mutation
  private SET(items: CharacterItem[]) {
    this.items = items;
  }

  @Action
  public async getItems(character_id: Number) {
    try {
      await $axios.$get(`player/${character_id}/items`)
        .then((res) => {
          if (!res) 
            throw new Error("Failed to get player items");

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
