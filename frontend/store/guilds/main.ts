import {
  Module,
  VuexModule,
  Mutation,
  Action
} from 'vuex-module-decorators'

import { $axios } from '@/utils/nuxt-instance'
import { Guild as GuildInterface } from '@/models'

@Module({
  name: 'guilds/main',
  stateFactory: true,
  namespaced: true
})

export default class Guild extends VuexModule {
  private guild = {} as GuildInterface;

  public get $guild() {
    return this.guild;
  }
  
  @Mutation
  private UPDATE_GUILD(guild: GuildInterface) {
    this.guild = guild;
  }

  @Action
  public async getGuild(name: String) {
    try {
      return await $axios.$get(`guild/view/${name}`)
        .then((response) => {
          if (!response) 
            throw new Error(response);
          
          this.context.commit('UPDATE_GUILD', response.result);
          
          return response.status;
        })
        .catch(() => {
          return 'SEARCH_NOTFOUND';
        });
    } catch(err) {
      return err;
    }
  }
}
