<template>
  <v-container class="dashboard-container">
    <v-row class="pa-0">
      <v-col cols="12" class="text-center">
        <h2> Top 10 - Most Premium Points </h2>
        <v-data-table
          :headers="headers"
          :items="getItems"
          hide-default-footer
          no-data-text="Nenhuma conta encontrada"
          fixed-header
        />
      </v-col>
    </v-row>
  </v-container>
</template>

<script lang="ts">
import Vue from 'vue'
import { TopPremiumPoints } from '@/models'

export default Vue.extend({
  props: {
    items: {
      type: Array,
      default: () => []
    }
  },

  data() {
    return {
      headers: [
        { text: 'Account', value: 'name' },
        { text: 'Premium Points', value: 'premium_points' },
      ]
    }
  },

  computed: {
    getItems(this: any): TopPremiumPoints[] {
      return this.items;
    }
  }
})
</script>