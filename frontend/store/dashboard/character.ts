import {
  Module,
  VuexModule,
  Mutation,
  Action
} from 'vuex-module-decorators'

import { $axios } from '@/utils/nuxt-instance'
import { Character, CharacterSkills } from '@/models'

@Module({
  name: 'dashboard/character',
  stateFactory: true,
  namespaced: true
})

export default class Characters extends VuexModule {
  private character = {
    id: undefined,
    name: undefined,
    world_id: undefined,
    type: undefined,
    account_id: undefined,
    level: undefined,
    vocation: undefined,
    health: undefined,
    healthmax: undefined,
    experience: undefined,
    lookbody: undefined,
    lookfeet: undefined,
    lookhead: undefined,
    looklegs: undefined,
    looktype: undefined,
    lookaddons: undefined,
    maglevel: undefined,
    mana: undefined,
    manamax: undefined,
    manaspent: undefined,
    soul: undefined,
    town_id: undefined,
    posx: undefined,
    posy: undefined,
    posz: undefined,
    cap: undefined,
    sex: undefined,
    lastlogin: undefined,
    lastip: undefined,
    save: undefined,
    skull: undefined,
    skulltime: undefined,
    rank_id: undefined,
    guildnick: undefined,
    lastlogout: undefined,
    blessings: undefined,
    pvp_blessing: undefined,
    balance: undefined,
    stamina: undefined,
    direction: undefined,
    loss_experience: undefined,
    loss_mana: undefined,
    loss_skills: undefined,
    loss_containers: undefined,
    loss_items: undefined,
    premend: undefined,
    online: undefined,
    marriage: undefined,
    marrystatus: undefined,
    promotion: undefined,
    deleted: undefined,
    description: undefined,
    created: undefined,
    nick_verify: undefined,
    old_name: undefined,
    hidden: undefined,
    worldtransfer: undefined,
    comment: undefined,
    show_outfit: undefined,
    show_eq: undefined,
    show_bars: undefined,
    show_skills: undefined,
    show_quests: undefined,
    exphist_lastexp: undefined,
    exphist1: undefined,
    exphist2: undefined,
    exphist3: undefined,
    exphist4: undefined,
    exphist5: undefined,
    exphist6: undefined,
    exphist7: undefined,
    onlinetimetoday: undefined,
    onlinetime1: undefined,
    onlinetime2: undefined,
    onlinetime3: undefined,
    onlinetime4: undefined,
    onlinetime5: undefined,
    onlinetime6: undefined,
    onlinetime7: undefined,
    onlinetimeall: undefined,
    ip: undefined,
    cast: undefined,
    castViewers: undefined,
    castDescription: null,
    frags: undefined,
    offlinetraining_time: undefined,
    offlinetraining_skill: undefined,
    broadcasting: undefined,
    viewers: undefined
  } as unknown as Character;

  private skills: CharacterSkills[] = [];

  public get $character(): Character {
    return this.character;
  }

  public get $skills(): CharacterSkills[] {
    return this.skills;
  }
  
  @Mutation
  private UPDATE_CHARACTERS(this: any, payload: Character) {
    this.character = Object.assign(this.character, payload);
  }
  
  @Mutation
  private UPDATE_SKILLS(this: any, payload: CharacterSkills) {
    this.skills = Object.assign(this.skills, payload);
  }

  @Action
  public async find(name: String) {
    try {
      return await $axios.$get(`dashboard/character/${name}`)
        .then((response) => {
          if (response.status !== 200) 
            throw new Error(response);

          this.context.commit('UPDATE_CHARACTERS', response.result);
          // this.context.commit('UPDATE_SKILLS', response.result.skills);

          return {
            status: response.status,
            data: response.result
          };
        })
        .catch(({ response }) => {
          return {
            data: [],
            status: response
          };
        });
    } catch(err) {
      return err;
    }
  }

  @Action
  public async update(payload: Character) {
    try {
      return await $axios.$post('dashboard/character', payload)
        .then((response) => {
          if (!response) 
            throw new Error(response);

          return response;
        })
        .catch(({ response }) => {
          return {
            data: response,
            status: response.status
          };
        });
    } catch(err) {
      return err;
    }
  }
}
