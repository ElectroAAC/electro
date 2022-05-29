<template>
  <v-row class="mt-2">

    <v-col class="pa-3" :cols="!$vuetify.breakpoint.smAndDown ? '6' : '12'">
      <CharacterInfo />
    </v-col>
    
    <v-col class="pa-3" :cols="!$vuetify.breakpoint.smAndDown ? '6' : '12'">
      <CharacterItems />
    </v-col>

    <v-col class="pa-3" cols="12">
      <CharacterSkills />
    </v-col>
    
    <v-col class="pa-3" cols="12">
      <CharacterAchievements />
    </v-col>
    
    <v-col class="pa-3" cols="12">
      <CharacterDeaths />
    </v-col>
  </v-row>
</template>

<script lang="ts">
import Vue from 'vue'
import { items } from '@/store'

export default Vue.extend({
  mounted() {
    if (!items.$items.length) {
      items.getItems('all');
    }
  }
})
</script>