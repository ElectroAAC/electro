<template>
  <v-row v-if="!$vuetify.breakpoint.xsOnly" class="pa-5">
    <h2> LOGO </h2>
    <v-spacer></v-spacer>
    <h2> {{ $guild.info.name }} </h2> 
    <v-spacer></v-spacer>
    <h2> LOGO </h2>
  </v-row>

  <v-row v-else class="pa-5 text-center">
    <h2> {{ $guild.info.name }} </h2> 
  </v-row>
</template>

<script lang="ts">
import Vue from 'vue'
import { guild } from '@/store'

export default Vue.extend({
  computed: {
    $guild() {
      return guild.$guild;
    }
  }
})
</script>