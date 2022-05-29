import {
  Module,
  VuexModule,
  Mutation,
  Action
} from 'vuex-module-decorators'

import { $axios } from '@/utils/nuxt-instance'

@Module({
  name: 'items/main',
  stateFactory: true,
  namespaced: true
})

export default class Items extends VuexModule {
  private items = [];

  public get $items() {
    return this.items;
  }

  @Mutation
  private SET_ITEMS(data: any) {
    this.items = data;
  }

  @Action
  public async getItems(type: string) {
    try {
      return await $axios.$get(`items/${type}`)
        .then((response) => {
          
          if (!response) 
            throw new Error(response);

          this.context.commit('SET_ITEMS', response.data);
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
