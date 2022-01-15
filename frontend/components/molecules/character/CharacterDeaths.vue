<template>
  <v-container class="bg-third text-center">
    <v-row 
      v-for="(death, idx) in $deaths"
      :key="idx"
    >
      <v-col cols="2"> 
        {{ formatDate(death.time) }}
      </v-col>
      <v-col cols="10"> 
        <span v-html="death.description" />
      </v-col>
    </v-row>
  </v-container>
</template>

<script lang="ts">
import Vue from 'vue'
import moment from 'moment'

import { character } from '@/store'

export default Vue.extend({
  computed: {
    $deaths() {
      return character.$deaths
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