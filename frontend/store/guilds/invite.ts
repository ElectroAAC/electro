import {
  Module,
  VuexModule,
  Mutation,
  Action
} from 'vuex-module-decorators'

import { $axios } from '@/utils/nuxt-instance'
import { guild } from '@/store'
interface Payload {
	guild_id: Number,
	character_invitation: String
}

@Module({
  name: 'guilds/invite',
  stateFactory: true,
  namespaced: true
})

export default class InviteGuild extends VuexModule {
  private inviteName = "";
  private acceptInvitation = "";

  public get $inviteName() {
    return this.inviteName;
  }

  public get $acceptInvitation() {
    return this.acceptInvitation;
  }

  @Mutation
  private SET_INVITE(name: string) {
    this.inviteName = name;
  }

  @Mutation
  private SET_ACCEPT(name: string) {
    this.acceptInvitation = name;
  }

  @Action
  public setInvite(name: string) {
    this.context.commit('SET_INVITE', name);
  }

  @Action
  public setAccept(name: string) {
    this.context.commit('SET_ACCEPT', name);
  }

  @Action
  public async invite(payload: Payload) {
    try {
      return await $axios.$post('guild/invite', payload)
        .then((response) => {
          if (!response) 
            throw new Error(response);
          
          return {
            status: response.status,
            message: response.result
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

  @Action
  public async accept(payload: Payload) {
    try {
      return await $axios.$post('guild/accept-invite', payload)
        .then((response) => {
          if (!response) 
            throw new Error(response);
          
          return {
            status: response.status,
            message: response.result
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

  @Action
  public async cancel(payload: Payload) {
    try {
      return await $axios.$post('guild/cancel-invite', payload)
        .then((response) => {
          if (!response) 
            throw new Error(response);
          
            guild.removeInvite(payload.character_invitation);
          return {
            status: response.status,
            message: response.result
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
