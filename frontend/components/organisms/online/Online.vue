<template>
  <v-container>
    <OnlineTable 
      :players_data="playersData"
    />
  </v-container>
</template>

<script lang="ts">
import Vue from 'vue'
import { online } from '@/store'

export default Vue.extend({
  data() {
    return {
      playersData: []
    }
  },

  async mounted() {
    await this.getOnline();
  },

  methods: {
    async getOnline() {
      const response = await online.getOnline();
      if (response.status === 200) {
        this.$set(this, 'playersData', response.data.playersOnline);
      }
    }
  }
})
</script>