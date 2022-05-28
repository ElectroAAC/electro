<template>
  <div class="character-informations text-center">
    <v-col class="pb-0" cols="12"> <h3> Deaths </h3> </v-col>
    
    <v-col v-if="!$deaths.length" cols="12">
      This player has no recorded kills.
    </v-col>

    <v-row 
      v-for="(death, idx) in $deaths"
      :key="idx"
      v-else
    >

      <v-col class="pa-1" cols="2"> 
        {{ formatDate(death.time) }}
      </v-col>

      <v-col class="pa-1" cols="10"> 
        <span v-html="death.description" />
      </v-col>
    </v-row>
  </div>
</template>

<script lang="ts">
import Vue from 'vue'
import moment from 'moment'

import { death } from '@/store'

export default Vue.extend({
  computed: {
    $deaths() {
      return death.$deaths
    }
  },

  methods: {
    formatDate(date: number): String {
      if (!date || date < 0) {
        return "";
      }
      return moment(date*1000).format("DD/MM/YYYY")
    }
  }
})
</script>