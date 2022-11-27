import {
  Module,
  VuexModule,
  Mutation,
  Action
} from 'vuex-module-decorators'

import { $axios } from '@/utils/nuxt-instance'

@Module({
  name: 'shop/payments/pix',
  stateFactory: true,
  namespaced: true
})

export default class Pix extends VuexModule {
  private value = "";

  public get $value() {
    return this.value;
  }

  @Mutation
  private SET_VALUE(data: string) {
    data = `${data}.00`
    this.value = data;
  }
  
  @Action
  public async generateQRCode(payload: Object) {
    try {
      return await $axios.$post('payments/pix/qrcode', payload)
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
  public setValue(value: string) {
    this.context.commit('SET_VALUE', value);
  }
}
