<template>
  <v-container class="bg-third text-center">
    <v-row class="fs-14">
      <v-col cols="2"
        v-for="(skill, idx) in $skills" 
        :key="idx"
      >
        <v-col cols="12"> {{ getSkillName(skill.skillid) }} </v-col>
        <v-col cols="12"> {{ skill.value }} </v-col>
      </v-col>
    </v-row>
  </v-container>
</template>

<script lang="ts">
import Vue from 'vue'
import { character } from '@/store'
import { skillName } from '@/utils/enum'

export default Vue.extend({
  computed: {
    $character() {
      return character.$info;
    },

    $skills() {
      return character.$skills;
    }
  },

  methods: {
    getSkillName(id: number): String {
      return skillName.find((skill) => skill.value === id)?.text
    }
  }
})
</script>