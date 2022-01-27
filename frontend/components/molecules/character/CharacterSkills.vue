<template>
  <v-container class="text-center">
    <v-row v-if="!$vuetify.breakpoint.mdAndDown" class="fs-14">
      <v-col 
        v-for="(item, idx) in $skills" 
        :key="idx"
        class="pl-1 pr-1"
        cols="2"
      >
        <v-col class="pa-1" cols="12"> {{ getSkillName(item.skillid) }} </v-col>
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
  </v-container>
</template>

<script lang="ts">
import Vue from 'vue'
import { character } from '@/store'
import { skillName } from '@/utils/enum'
import { Skill } from '@/models'

export default Vue.extend({
  computed: {
    $character() {
      return character.$info;
    },

    $skills(): Skill[] {
      return character.$skills;
    }
  },

  methods: {
    getSkillName(id: number): String | undefined {
      return skillName.find((skill) => skill.value === id)?.text
    }
  }
})
</script>