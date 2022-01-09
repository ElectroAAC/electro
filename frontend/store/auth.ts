import {
  Module,
  VuexModule,
  Mutation,
  Action
} from 'vuex-module-decorators'

import { $axios, $cookies } from '@/utils/nuxt-instance'
import { account } from '@/store'

interface CreatePayload {
  name: string
  password: string,
  rememberMe: boolean
}

interface UpdatePayload {
  token?: string
}

type Token = string | null

@Module({
  name: 'auth',
  stateFactory: true,
  namespaced: true
})

export default class Auth extends VuexModule {
  private token = {} as Token;

  public get $token() {
    return this.token
  }

  @Mutation
  private UPDATE_TOKEN(token: Token) {
    this.token = token
  }

  @Action
  public async create(payload: CreatePayload) {
    const status = await $axios.$post('auth', payload)
      .then(async (res) => {
        if (!res) 
          throw new Error("Failed to authentication");
        
        const age = payload.rememberMe ? 60 * 60 * 24 * 7 : 60 * 60;

        $cookies.set('token', res.token, {
          path: '/',
          maxAge: age
        });

        this.context.commit('UPDATE_TOKEN', res.token);
        return 200;
      })
      .catch(() => {
        return 400;
      });
    
    await account.get();

    return status;
  }

  @Action
  public update(payload: UpdatePayload) {
    const token = payload?.token ? payload.token : $cookies.get('token');

    this.context.commit('UPDATE_TOKEN', token || null)
  }

  @Action
  async destroy() {
    await $axios.delete('/auth');

    if ($cookies.get('token'))
      $cookies.remove('token');

    this.context.commit('UPDATE_TOKEN', null);

    await account.destroy();
  }
}
