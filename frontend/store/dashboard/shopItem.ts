import {
  Module,
  VuexModule,
  Mutation,
  Action
} from 'vuex-module-decorators'

import { $axios } from '@/utils/nuxt-instance'

import { Paginate } from '@/models'

interface CreatePayload {
  name: String | null,
  description: String | null
}

interface UpdatePayload {
  offer_id?: Number,
  name: String | null,
  hidden?: Boolean,
  description: String | null
}

@Module({
  name: 'dashboard/shopItem',
  stateFactory: true,
  namespaced: true
})

export default class ShopItem extends VuexModule {
  private item = {
    offer_id: undefined,
    category_id: undefined,
    name: "",
    description: "",
    price: undefined,
    itemId1: undefined,
    count1: undefined
  }

  public get $item() {
    return this.item;
  }

  @Mutation
  private UPDATE_ITEM(data: any) {
    this.item = data;
  }

  @Mutation
  private RESET(data: any) {
    this.item = {
      offer_id: undefined,
      category_id: undefined,
      name: "",
      description: "",
      price: undefined,
      itemId1: undefined,
      count1: undefined
    };
  }

  @Action
  public async getAll(payload: Paginate) {
    try {
      return await $axios.$get(`shop/item/list/${payload.page}/${payload.limit}`)
        .then((response) => {
          if (response.status !== 200) 
            throw new Error(response);
          
          return {
            data: response.items.data,
            status: response.status,
            total: response.items.meta.last_page
          };
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

  @Action
  public async create(payload: CreatePayload) {
    try {
      return await $axios.$post(`shop/item/create`, payload)
        .then((response) => {
          if (!response) 
            throw new Error(response);

          return response;
        })
        .catch(({ response }) => {
          return {
            message: response.data.message ? response.data.message : response.data.errors[0].message,
            status: response.status
          };
        });
    } catch(err) {
      return err;
    }
  }

  @Action
  public async find(id: number) {
    try {
      return await $axios.$get(`shop/item/find/${id}`)
        .then((response) => {
          if (!response) 
            throw new Error(response);
          
          this.context.commit('UPDATE_ITEM', {
            offer_id: response.category[0].id,
            category_id: response.category[0].category_id,
            name: response.category[0].name,
            description: response.category[0].description,
            price: response.category[0].price,
            itemId1: response.category[0].itemId1,
            count1: response.category[0].count1
          });

          return {
            status: response.status,
            data: response.item[0]
          };
        })
        .catch(({ response }) => {
          return {
            message: response.data.message ? response.data.message : response.data.errors[0].message,
            status: response.status
          };
        });
    } catch(err) {
      return err;
    }
  }

  @Action
  public async update(payload: UpdatePayload) {
    try {
      return await $axios.$put('shop/item/update', payload)
        .then((response) => {
          if (!response) 
            throw new Error(response);

          return response;
        })
        .catch(({ response }) => {
          return {
            message: response.data.message ? response.data.message : response.data.errors[0].message,
            status: response.status
          };
        });
    } catch(err) {
      return err;
    }
  }

  @Action
  public reset() {
    this.context.commit('RESET');
  }
}
