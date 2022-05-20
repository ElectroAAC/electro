<template>
  <v-container>
    <EmptyCart v-if="!$cart.length" />

    <PurchaseItems v-else />
    
    <Purchase />
  </v-container>
</template>

<script lang="ts">
import Vue from 'vue'
import { shop } from '@/store'

export default Vue.extend({
  computed: {
    $cart() {
      return shop.$cart;
    }
  }
})
</script>