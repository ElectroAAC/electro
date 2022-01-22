<template>
  <aside class="widget">
    <h5 class="widget-title"> Status </h5>
    <v-container class="text-center">
      Players Online: <br>
      <NuxtLink to="/online"> {{ playersOnline.length }} / {{ maxPlayers}} </NuxtLink>
    </v-container>
  </aside>
</template>

<script lang="ts">
import Vue from 'vue'
import { online } from '@/store'

export default Vue.extend({
  data() {
    return {
      status: false,
      maxPlayers: 500,
      playersOnline: []
    }
  },

  async mounted(this: any) {
    await this.getOnline();
  },

  methods: {
    async getOnline() {
      const response = await online.getOnline();
      if (response.status === 200) {
        this.$set(this, 'playersOnline', response.data.playersOnline);
      }
    }
  }
})
</script>