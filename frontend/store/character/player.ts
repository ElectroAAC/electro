import {
  Module,
  VuexModule,
  Mutation,
  Action
} from 'vuex-module-decorators'

import { $axios } from '@/utils/nuxt-instance'

import { Item, Death, Player, Skill } from '@/models'

@Module({
  name: 'character/player',
  stateFactory: true,
  namespaced: true
})

export default class Character extends VuexModule {
  private player = {} as Player;
  private skill: Skill[] = [];
  private items = {} as Item[];
  private death = [] as Death[];

  public get $info() {
    return this.player;
  }

  public get $skills() {
    return this.skill;
  }

  public get $items() {
    return this.items;
  }

  @Mutation
  private UPDATE_PLAYER(player: Player) {
    this.player = player
  }

  @Mutation
  private UPDATE_SKILL(skill: Skill[]) {
    this.skill = skill;
  }

  @Mutation
  private UPDATE_ITEMS(items: Item[]) {
    this.items = items;
  }

  @Mutation
  private UPDATE_DEATHS(deaths: Death[]) {
    this.death = deaths;
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

  @Action
  public async getItems(id: Number) {
    try {
      await $axios.$get(`player/${id}/items`)
        .then((res) => {
          if (!res) 
            throw new Error("Failed to get player items");

          this.context.commit('UPDATE_ITEMS', res.result);

          return 200;
        })
        .catch(() => {
          this.context.commit('UPDATE_ITEMS', []);
          return 400;
        });
    } catch(err) {
      this.context.commit('UPDATE_ITEMS', []);
      return 400;
    }
  }

  @Action
  public async getDeaths(id: Number) {
    try {
      await $axios.$post(`player/${id}/deaths`, {
        remote_url: process.env.REMOTE_URL + '/character'
      })
        .then((res) => {
          if (!res) 
            throw new Error("Failed to get player deaths");

          this.context.commit('UPDATE_DEATHS', res.result);

          return 200;
        })
        .catch(() => {
          this.context.commit('UPDATE_DEATHS', []);
          return 400;
        });
    } catch(err) {
      this.context.commit('UPDATE_DEATHS', []);
      return 400;
    }
  }
}
