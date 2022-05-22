import {
  Module,
  VuexModule,
  Mutation,
  Action
} from 'vuex-module-decorators'

import { $axios } from '@/utils/nuxt-instance'

@Module({
  name: 'shop/categorie',
  stateFactory: true,
  namespaced: true
})

export default class ShopCategorie extends VuexModule {
  private categories = [];

  public get $categories() {
    return this.categories;
  }

  @Mutation
  private SET_CATEGORIES(data: Object[]) {
    this.categories = data;
  }

  @Action
  public async getCategories() {
    try {
      return await $axios.$get('shop/categories').then((response) => {
        if (!response) 
          throw new Error(response);
        
        this.context.commit('SET_CATEGORIES', response.result.data);
      })
      .catch(({ response }) => {
        return response;
      });
    } catch(err) {
      return err;
    }
  }
}
