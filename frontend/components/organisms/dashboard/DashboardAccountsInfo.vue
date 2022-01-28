<template>
  <v-row class="pa-0">
    <v-col :cols="!$vuetify.breakpoint.mdAndDown ? '6' : '12'">
      <DashboardPremiumPoints
        :items="getTopPremiumPoints"
      />
    </v-col>
    <v-col :cols="!$vuetify.breakpoint.mdAndDown ? '6' : '12'">
      <DashboardDoughnutVocations />
    </v-col>
  </v-row>
</template>

<script lang="ts">
import Vue from 'vue'
import { dashboardHome } from '@/store'
import { TopPremiumPoints } from '@/models'

export default Vue.extend({
  computed: {
    getTopPremiumPoints(): TopPremiumPoints[] {
      return dashboardHome.$topPremiumPoints;
    }
  }
})
</script>