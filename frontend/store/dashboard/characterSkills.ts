import {
  Module,
  VuexModule,
  Mutation,
  Action
} from 'vuex-module-decorators'

import { $axios } from '@/utils/nuxt-instance'
import { CharacterSkills } from '@/models'

interface UpdatePayload {
  id: number,
  skills: CharacterSkills[]
}

@Module({
  name: 'dashboard/characterSkills',
  stateFactory: true,
  namespaced: true
})

export default class CharacterSkill extends VuexModule {
  private skills: CharacterSkills[] = [];

  public get $skills(): CharacterSkills[] {
    return this.skills;
  }
  
  @Mutation
  private UPDATE_SKILLS(this: any, payload: CharacterSkills) {
    this.skills = Object.assign(this.skills, payload);
  }

  @Action
  public async find(id: Number) {
    try {
      return await $axios.$get(`dashboard/character-skills/${id}`)
        .then((response) => {
          if (response.status !== 200) 
            throw new Error(response);

          this.context.commit('UPDATE_SKILLS', response.result);

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
  public async update(payload: UpdatePayload) {
    try {
      return await $axios.$post('dashboard/character-skills', payload)
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
