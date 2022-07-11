<template>
  <aside class="widget">
    <h5 class="widget-title"> <span> Status Server </span> </h5>
    
    <div v-if="status" class="text-center color-orange bold pa-5">
      Players Online: <br>
      <NuxtLink to="/online"> {{ playersOnline.length }} / {{ maxPlayers}} </NuxtLink>
    </div>
    <div v-else class="text-center color-red bold pa-5">
      Server offline
    </div>
  </aside>
</template>

<script lang="ts">
import Vue from 'vue'
import { 
  online,
  status as ServerStatus,
  server
} from '@/store'

export default Vue.extend({
  data() {
    return {
      status: false,
      maxPlayers: 0,
      playersOnline: []
    }
  },

  async mounted(this: any) {
    await this.getServerStatus();
    await this.getMaxPlayers();
    await this.getOnline();
  },

  methods: {
    async getServerStatus() {
      const status = await ServerStatus.getStatus();
      this.$set(this, 'status', status.serverStatus);
    },

    async getMaxPlayers() {
      const res = await server.getMaxPlayers();
      this.$set(this, 'maxPlayers', res && res.maxPlayers ? res.maxPlayers : 0);
    },

    async getOnline() {
      const response = await online.getOnline();
      if (response.status === 200) {
        this.$set(this, 'playersOnline', response.data.playersOnline);
      }
    }
  }
})
</script>