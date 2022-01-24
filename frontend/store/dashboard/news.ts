import {
  Module,
  VuexModule,
  Mutation,
  Action
} from 'vuex-module-decorators'

import { $axios } from '@/utils/nuxt-instance'

import { Paginate } from '@/models'

interface CreatePostPayload {
  title: String | null,
  description: String | null
}

interface UpdatePayload {
  news_id?: Number,
  hidden?: Boolean,
  title: String | null,
  description: String | null
}

@Module({
  name: 'dashboard/news',
  stateFactory: true,
  namespaced: true
})

export default class News extends VuexModule {
  private post = {
    news_id: undefined,
    title: "",
    description: "",
    hidden: false
  }

  public get $post() {
    return this.post;
  }
  
  @Mutation
  private UPDATE_POST(this: any, payload: CreatePostPayload) {
    this.post = Object.assign(this.post, payload);
  }

  @Action
  public async getAll(payload: Paginate) {
    try {
      return await $axios.$get(`news/listDashboard/${payload.page}/${payload.limit}`)
        .then((response) => {
          if (!response) 
            throw new Error(response);
            
          return {
            data: response.news.data,
            status: response.status,
            total: response.news.meta.last_page
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
  public async update(payload: CreatePostPayload) {
    this.context.commit('UPDATE_POST', payload)
  }

  @Action
  public async createNewPost(payload: CreatePostPayload) {
    try {
      return await $axios.$post(`news/create-post`, payload)
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
  public async findPost(id: number) {
    try {
      return await $axios.$get(`news/find/${id}`)
        .then((response) => {
          if (!response) 
            throw new Error(response);
          
          this.context.commit('UPDATE_POST', {
            news_id: response.page[0].id,
            title: response.page[0].title,
            description: response.page[0].body,
            hidden: response.page[0].hidden
          });

          return {
            status: response.status,
            data: response.page[0]
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
  public async editPost(payload: UpdatePayload) {
    try {
      return await $axios.$post('news/edit', payload)
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
}
