import {
  Module,
  VuexModule,
  Mutation,
  Action
} from 'vuex-module-decorators'

import { $axios } from '@/utils/nuxt-instance'

@Module({
  name: 'shop/main',
  stateFactory: true,
  namespaced: true
})

export default class Shop extends VuexModule {
  private offers = [];

  public get $offers() {
    return this.offers;
  }

  @Mutation
  private SET_OFFERS(data: Object[]) {
    this.offers = data;
  }

  @Action
  public async getOffers(categorie: string) {
    try {
      return await $axios.$get(`shop/offers/${categorie}`).then((response) => {
        if (!response) 
          throw new Error(response);

        this.context.commit('SET_OFFERS', response.result);
      })
      .catch(({ response }) => {
        return response;
      });
    } catch(err) {
      return err;
    }
  }
}
