<template>
  <v-container>
    <Loading v-if="loading"/>

    <CreatureTable 
      v-else
      :data="data"
    />
  </v-container>
</template>

<script lang="ts">
import Vue from 'vue'
import { creatures } from '@/store'

export default Vue.extend({
  data() {
    return {
      data: [],
      loading: true
    }
  },

  async mounted() {
    await this.getCreatures();
  },

  methods: {
    async getCreatures() {
      this.$set(this, 'loading', true);
      const response = await creatures.getCreatures();
      if (response.status === 200) {
        this.$set(this, 'data', response.data);
      }
      this.$set(this, 'loading', false);
    }
  }
})
</script>