<template>
  <v-container>
    <EmptyCart v-if="!$cart.length" />

    <div v-else-if="!$checkout">

      <PurchaseItems/>
      
      <PurchaseButton />
    </div>

    <ConfirmCheckout v-else />
  </v-container>
</template>

<script lang="ts">
import Vue from 'vue'
import { shop } from '@/store'

export default Vue.extend({
  computed: {
    $cart() {
      return shop.$cart;
    },
    
    $checkout() {
      return shop.$checkout;
    }
  },
})
</script>