import {
  Module,
  VuexModule,
  Mutation,
  Action
} from 'vuex-module-decorators'

import { $axios } from '@/utils/nuxt-instance'

import { Storage } from '@/models'

@Module({
  name: 'character/storage',
  stateFactory: true,
  namespaced: true
})

export default class Storages extends VuexModule {
  private storages: Storage[] = [];

  public get $storages() {
    return this.storages;
  }

  @Mutation
  private SET(storage: Storage[]) {
    this.storages = storage;
  }

  @Action
  public async getStorages(character_id: number) {
    try {
      return await $axios.$get(`player/${character_id}/storages`)
        .then((response) => {
          if (!response) 
            throw new Error(response);

          this.context.commit('SET', response.result);
        })
        .catch(() => {
          this.context.commit('SET', []);
        });
    } catch(err) {
      this.context.commit('SET', []);
      return err;
    }
  }
}
