import {
  Module,
  VuexModule,
  Mutation,
  Action
} from 'vuex-module-decorators'

import { $axios } from '@/utils/nuxt-instance'

import { Player, Skill } from '@/models'

@Module({
  name: 'character/player',
  stateFactory: true,
  namespaced: true
})

export default class Character extends VuexModule {
  private player = {} as Player;
  private skill: Skill[] = [];

  public get $info() {
    return this.player;
  }

  public get $skills() {
    return this.skill;
  }

  @Mutation
  private UPDATE_PLAYER(player: Player) {
    this.player = player
  }

  @Mutation
  private UPDATE_SKILL(skill: Skill[]) {
    this.skill = skill;
  }

  @Action
  public async getPlayer(name: String) {
    try {
      await $axios.$get(`player/${name}`)
        .then((res) => {
          if (!res) 
            throw new Error("Failed to get player");

          this.context.commit('UPDATE_PLAYER', res.result[0]);

          return 200;
        })
        .catch(() => {
          this.context.commit('UPDATE_PLAYER', {});
          return 400;
        });
      return 200;
    } catch(err) {
      this.context.commit('UPDATE_PLAYER', {});
      return 400;
    }
  }

  @Action
  public async getSkill(id: Number) {
    try {
      await $axios.$get(`player/${id}/skills`)
        .then((res) => {
          if (!res) 
            throw new Error("Failed to get player skill");

          this.context.commit('UPDATE_SKILL', res.result);

          return 200;
        })
        .catch(() => {
          this.context.commit('UPDATE_SKILL', null);
          return 400;
        });
    } catch(err) {
      this.context.commit('UPDATE_SKILL', null);
      return 400;
    }
  }
}
