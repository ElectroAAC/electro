<template>
  <v-row>
    <v-col class="text-center" cols="12">
      <v-btn
        depressed
        class="mt-5 btn btn-success-primary"
        rounded
        @click="setCheckout()"
      >
        <v-icon> mdi-currency-usd </v-icon>
        Purchase
      </v-btn>
    </v-col>
  </v-row>
</template>

<script lang="ts">
import Vue from 'vue'
import { shop } from '@/store'

export default Vue.extend({
  methods: {
    setCheckout() {
      shop.changeCheckout(true);
    }
  }
})
</script>