import {
  Module,
  VuexModule,
  Action
} from 'vuex-module-decorators'

import { $axios } from '@/utils/nuxt-instance'

interface ChangeMotd {
  account_id: number,
	guild_i: number,
	motd: string
}

@Module({
  name: 'guilds/manage',
  stateFactory: true,
  namespaced: true
})

export default class ManageGuild extends VuexModule {

  @Action
  public async changeMotd(payload: ChangeMotd) {
    try {
      return await $axios.$post('guild/change-motd', payload)
        .then((response) => {
          if (!response) 
            throw new Error(response);
          
          return {
            status: response.status,
            message: response.result
          };
        })
        .catch(({ response }) => {
          return {
            status: 404,
            message: response.data.errors[0].message
          };
        });
    } catch(err) {
      return err;
    }
  }
}
