import {
  Module,
  VuexModule,
  Mutation,
  Action
} from 'vuex-module-decorators'

import { $axios } from '@/utils/nuxt-instance'

interface CreatePayload {
  name: String,
  character_id: Number
}

@Module({
  name: 'guilds/create',
  stateFactory: true,
  namespaced: true
})

export default class CreateGuild extends VuexModule {
  private guild = {};

  public get $info() {
    return this.guild
  }
  
  @Mutation
  private UPDATE_GUILD(guild: CreatePayload) {
    this.guild = Object.assign(this.guild, guild);
  }

  @Action
  public updateGuild(payload: CreatePayload) {
    this.context.commit('UPDATE_GUILD', payload);
  }

  @Action
  public async createGuild(payload: CreatePayload) {
    try {
      return await $axios.$post('guild/create-guild', payload)
        .then((response) => {
          if (!response) 
            throw new Error(response);
          
          return {
            status: response.status,
            message: response.message
          };
        })
        .catch(({ response }) => {
          console.log(response);
          return {
            status: status,
            message: response.data.errors[0].message
          };
        });
    } catch(err) {
      return err;
    }
  }

  @Action
  public async getPlayersWithGuild() {
    return await $axios.$get('guildW/players-with-guild')
      .then((res) => {
        if (!res) 
          throw new Error("Failed to get chracters to account");

        return {
          status: res.status,
          characters: res.character
        };
      })
      .catch((err) => {
        console.log(err);
        return {
          status: 404,
          characters: []
        }
      });
  }
}
