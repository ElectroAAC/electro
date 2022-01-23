import {
  Module,
  VuexModule,
  Mutation,
  Action
} from 'vuex-module-decorators'

import { $axios } from '@/utils/nuxt-instance'

interface CreatePostPayload {
  text: String | null,
  description: String | null
}

@Module({
  name: 'dashboard/news',
  stateFactory: true,
  namespaced: true
})

export default class News extends VuexModule {
  private post = {
    title: "",
    description: ""
  }

  public get $post() {
    return this.post;
  }
  
  @Mutation
  private UPDATE_POST(this: any, payload: CreatePostPayload) {
    this.post = Object.assign(this.post, payload);
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
}
