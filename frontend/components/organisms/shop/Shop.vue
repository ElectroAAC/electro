<template>
  <v-container>
    <ShopCategories />
  </v-container>
</template>

<script lang="ts">
import Vue from 'vue'
import { shop, shopCategorie } from '@/store'

export default Vue.extend({
  async mounted() {
    const promise = [
      shop.getOffers('all'),
      shopCategorie.getCategories()
    ];

    await Promise.all(promise);
  }
})
</script>