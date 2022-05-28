<template>
  <div class="character-informations text-center">
    <v-col cols="12"> <h3> Skills </h3> </v-col>

    <v-row v-if="$vuetify.breakpoint.mdAndDown" class="fs-14">
      <v-col 
        v-for="(item, idx) in $skills" 
        :key="idx"
        class="pl-1 pr-1"
        cols="2"
      >
        <v-col class="pa-1 bold" cols="12"> 
          <v-tooltip top>
            <template v-slot:activator="{ on, attrs }">
              <div v-bind="attrs" v-on="on">
                <SkillImage 
                  :image="item.skillid" 
                  :image_name="getSkillName(item.skillid)" 
                />
              </div>
            </template>
            <span> {{ getSkillName(item.skillid) }} </span>
          </v-tooltip>
        </v-col>

        <v-col class="pa-1" cols="12"> {{ item.value }} </v-col>
      </v-col>
    </v-row>

    <v-row
      v-for="(item, idx) in $skills" 
      v-else
      :key="idx"
    >
      <v-col cols="6">{{ getSkillName(item.skillid) }}</v-col>
      <v-col cols="6"> {{ item.value }}</v-col>
    </v-row>
  </div>
</template>

<script lang="ts">
import Vue from 'vue'
import { character, skill } from '@/store'
import { skillName } from '@/utils/enum'
import { Skill } from '@/models'

export default Vue.extend({
  computed: {
    $character() {
      return character.$info;
    },

    $skills(): Skill[] {
      return skill.$skills;
    }
  },

  methods: {
    getSkillName(id: Number): String | undefined {
      return skillName.find((skill) => skill.value === id)?.text
    }
  }
})
</script>