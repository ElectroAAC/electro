import {
  Module,
  VuexModule,
  Mutation,
  Action
} from 'vuex-module-decorators'

import { $axios } from '@/utils/nuxt-instance'
import { Guild as GuildInterface } from '@/models'

interface Payload {
	guild_id: Number
}

interface Invites {
  id: Number,
	name: String
}
@Module({
  name: 'guilds/main',
  stateFactory: true,
  namespaced: true
})

export default class Guild extends VuexModule {
  private guild = {} as GuildInterface;
  private invites: Invites[] = [];

  public get $guild() {
    return this.guild;
  }

  public get $invites() {
    return this.invites;
  }
  
  @Mutation
  private UPDATE_GUILD(guild: GuildInterface) {
    this.guild = guild;
  }
  
  @Mutation
  private UDPATE_INVITES(invite: Invites[]) {
    this.invites = invite;
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

  @Action
  public async getInvites(payload: Payload) {
    try {
      return await $axios.$post('guild/invites', payload)
        .then((response) => {
          if (!response) 
            throw new Error(response);
          
          this.context.commit('UDPATE_INVITES', response.result);

          return {
            status: response.status,
            data: response.result
          };
        })
        .catch(({ response }) => {
          console.log(response);
          return {
            status: 404,
            message: response.data.message
          };
        });
    } catch(err) {
      return err;
    }
  }
}
