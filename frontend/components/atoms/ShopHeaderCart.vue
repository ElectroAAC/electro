<template>
  <v-btn icon @click="checkout">
    <v-badge
      :content="`${$cart.length}`"
      overlap
    >
      <v-icon
        color="grey lighten-1"
        large
      >
        mdi-cart
      </v-icon>
    </v-badge>
  </v-btn>
</template>

<script lang="ts">
import Vue from 'vue'
import { shop } from '@/store'

export default Vue.extend({
  computed: {
    $cart() {
      return shop.$cart;
    }
  },

  methods: {
    checkout() {
      this.$router.replace('/shop/checkout')
    }
  }
})
</script>