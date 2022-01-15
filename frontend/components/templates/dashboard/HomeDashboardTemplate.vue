<template>
  <div>
    <DashboardServerStatus />
  </div>
</template>

<script lang="ts">
import Vue from 'vue'
import { dashboardHome } from '@/store'

export default Vue.extend({
  async mounted() {
    
    const promises = [
      dashboardHome.getTotalAccounts(),
      dashboardHome.getTotalPlayers(),
      dashboardHome.getTotalGuilds()
    ];

    await Promise.all(promises);
  }
})
</script>