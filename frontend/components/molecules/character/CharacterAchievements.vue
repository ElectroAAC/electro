<template>
  <div class="text-center">
    <v-row class="character-informations ext-center ma-0 pa-0">
      <v-col cols="12"> <h3> Achievements </h3> </v-col>

      <v-col v-for="(achievement, idx) in achievementList" :key="idx" :cols="!$vuetify.breakpoint.smAndDown ? '2' : '4'">
        <v-icon :color="hasAchievement(achievement.value) ? 'green' : 'red'">
         {{ hasAchievement(achievement.value) ? 'mdi-check' : 'mdi-close' }}
        </v-icon> <br>
        {{ achievement.text }}
      </v-col>
    </v-row>
  </div>
</template>

<script lang="ts">
import Vue from 'vue'
import { storage } from '@/store'
import { achievements } from '@/utils/enum'

export default Vue.extend({
  computed: {
    $storages() {
      return storage.$storages;
    },

    achievementList() {
      return achievements;
    }
  },

  methods: {
    hasAchievement(value: number): boolean { 
      const hasAchievement = this.$storages.find((storage) => storage.value === value);
      return hasAchievement ? true : false;
    }
  }
})
</script>