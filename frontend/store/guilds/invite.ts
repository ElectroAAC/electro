import {
  Module,
  VuexModule,
  Mutation,
  Action
} from 'vuex-module-decorators'

import { $axios } from '@/utils/nuxt-instance'

interface InvitePayload {
  account_id: Number,
	guild_id: number,
	character_invitation: string
}

@Module({
  name: 'guilds/invite',
  stateFactory: true,
  namespaced: true
})

export default class InviteGuild extends VuexModule {
  private inviteName = "";

  public get $inviteName() {
    return this.inviteName;
  }

  @Mutation
  private SET_INVITE(name: string) {
    this.inviteName = name;
  }

  @Action
  public setInvite(name: string) {
    this.context.commit('SET_INVITE', name);
  }

  @Action
  public async invite(payload: InvitePayload) {
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
}
