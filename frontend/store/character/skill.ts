import {
  Module,
  VuexModule,
  Mutation,
  Action
} from 'vuex-module-decorators'

import { $axios } from '@/utils/nuxt-instance'

import { Skill } from '@/models'

@Module({
  name: 'character/skill',
  stateFactory: true,
  namespaced: true
})

export default class Sills extends VuexModule {
  private skills: Skill[] = [];

  public get $skills() {
    return this.skills;
  }

  @Mutation
  private SET(skills: Skill[]) {
    this.skills = [];
    
    const entries = Object.entries(skills[0]);

    entries.map((skill: any, idx) => {
      this.skills.push({
        skillid: idx,
        value: skill[1]
      })
    });
  }

  @Action
  public async getSkills(character_id: Number) {
    try {
      await $axios.$get(`player/${character_id}/skills`)
        .then((res) => {
          if (!res) 
            throw new Error("Failed to get player skills");

          this.context.commit('SET', res.result);

          return 200;
        })
        .catch(() => {
          this.context.commit('SET', []);
          return 400;
        });
    } catch(err) {
      this.context.commit('SET', []);
      return 400;
    }
  }
}
