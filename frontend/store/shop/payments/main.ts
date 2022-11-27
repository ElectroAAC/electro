import {
  Module,
  VuexModule,
  Mutation,
  Action
} from 'vuex-module-decorators'

import { $axios } from '@/utils/nuxt-instance'

@Module({
  name: 'shop/payments/main',
  stateFactory: true,
  namespaced: true
})

export default class Payment extends VuexModule {
  private double_points = false;

  public get $double_points() {
    return this.double_points;
  }

  @Mutation
  private SET_DOUBLE_POINTS(data: boolean) {
    this.double_points = data;
  }

  @Action
  public async getDoublePoints() {
    try {
      return await $axios.$get('payments/doublepoints').then((response) => {
        if (!response) 
          throw new Error(response);
        
        this.context.commit('SET_DOUBLE_POINTS', response.result);
      })
      .catch(({ response }) => {
        return response;
      });
    } catch(err) {
      return err;
    }
  }
}
