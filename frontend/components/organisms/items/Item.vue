<template>
  <v-container>
    <Loading v-if="loading"/>

    <ItemTable />
  </v-container>
</template>

<script lang="ts">
import Vue from 'vue'
import { items } from '@/store'

export default Vue.extend({
  data() {
    return {
      data: [],
      loading: true
    }
  },

  async mounted() {
    await this.getItems();
  },

  methods: {
    async getItems() {
      this.$set(this, 'loading', true);

      await items.getItems('head');
      
      this.$set(this, 'loading', false);
    }
  }
})
</script>