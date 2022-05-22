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
  private cart = [];
  private checkout = false;
  private to_player_name = "";

  public get $offers() {
    return this.offers;
  }

  public get $cart() {
    return this.cart;
  }

  public get $checkout() {
    return this.checkout;
  }

  public get $to_player_name() {
    return this.to_player_name;
  }

  @Mutation
  private SET_OFFERS(data: Object[]) {
    this.offers = data;
  }

  @Mutation
  private CHANGE_CHECKOUT(status: boolean) {
    this.checkout = status;
  }

  @Mutation
  private SET_TO_PLAYER_NAME(name: string) {
    this.to_player_name = name;
  }

  @Mutation
  private RESET_PURCHASE() {
    this.cart = [];
  }

  @Action
  public async getOffers(categorie: string) {
    try {
      return await $axios.$get(`shop/offers/${categorie}`)
        .then((response) => {
          if (!response) 
            throw new Error(response);
          
          this.context.commit('SET_OFFERS', response.result.data);
        })
        .catch(({ response }) => {
          return response;
        });
    } catch(err) {
      return err;
    }
  }

  @Action
  public async finalizePurchase(payload: Object) {
    try {
      return await $axios.$post('shop/purchase', payload)
        .then((response) => {
          if (response.status !== 200) 
            throw new Error(response);

          return response;
        })
        .catch(({ response }) => {
          return response;
        });
    } catch(err) {
      return err;
    }
  }

  @Action
  public changeCheckout(status: boolean) {
    this.context.commit('CHANGE_CHECKOUT', status);
  }

  @Action
  public setToPlayerName(name: string) {
    this.context.commit('SET_TO_PLAYER_NAME', name);
  }

  @Action
  public resetPurchase() {
    this.context.commit('RESET_PURCHASE');
  }
}
