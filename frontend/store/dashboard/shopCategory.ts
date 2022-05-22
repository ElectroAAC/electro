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
  category_id?: Number,
  name: String | null,
  hidden?: Boolean,
  description: String | null
}

@Module({
  name: 'dashboard/shopCategory',
  stateFactory: true,
  namespaced: true
})

export default class ShopCategory extends VuexModule {
  private categorie = {
    category_id: undefined,
    name: "",
    description: "",
    hidden: false
  }

  public get $categorie() {
    return this.categorie;
  }

  @Mutation
  private UPDATE_CATEGORY(data: any) {
    this.categorie = data;
  }

  @Mutation
  private RESET(data: any) {
    this.categorie = {
      category_id: undefined,
      name: "",
      description: "",
      hidden: false
    };
  }

  @Action
  public async getAll(payload: Paginate) {
    try {
      return await $axios.$get(`shop/category/list/${payload.page}/${payload.limit}`)
        .then((response) => {
          if (response.status !== 200) 
            throw new Error(response);
          
          return {
            data: response.categories.data,
            status: response.status,
            total: response.categories.meta.last_page
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
      return await $axios.$post(`shop/category/create`, payload)
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
      return await $axios.$get(`shop/category/find/${id}`)
        .then((response) => {
          if (!response) 
            throw new Error(response);
          
          this.context.commit('UPDATE_CATEGORY', {
            category_id: response.category[0].id,
            name: response.category[0].name,
            description: response.category[0].description,
            hidden: response.category[0].hidden
          });

          return {
            status: response.status,
            data: response.category[0]
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
      return await $axios.$put('shop/category/update', payload)
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
