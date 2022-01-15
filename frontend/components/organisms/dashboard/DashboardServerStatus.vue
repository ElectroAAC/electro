<template>
  <v-row class="pa-0">
    <v-col cols="4">
      <DashboardAccountStatus 
        :total_accounts="totalAccounts"
      />
    </v-col>

    <v-col cols="4">
      <DashboardPlayersStatus 
        :total_players="totalPlayers"
      />
    </v-col>

    <v-col cols="4">
      <DashboardGuildsStatus 
        :total_guilds="totalGuilds"
      />
    </v-col>
  </v-row>
</template>

<script lang="ts">
import Vue from 'vue'
import { dashboardHome } from '@/store'

export default Vue.extend({
  computed: {
    totalAccounts(): Number {
      return dashboardHome.$totalAccounts;
    },
    totalPlayers(): Number {
      return dashboardHome.$totalPlayers;
    },
    totalGuilds(): Number {
      return dashboardHome.$totalGuilds
    }
  }
})
</script>