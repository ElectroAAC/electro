<template>
  <v-container>
    <v-row class="pa-0">
      <v-col class="header-table text-center" cols="7">
        Product
      </v-col>

      <v-col class="header-table text-center" cols="3">
        Price
      </v-col>

      <v-col cols="2" />
    </v-row>
    
    <v-row v-for="(offer, idx) in $offers" :key="idx" class="pa-0"> 
      <v-col class="text-center" cols="7">
        <ItemImage :image="offer.itemId1" :image_name="offer.name"/>
        {{ offer.name }}
      </v-col>

      <v-col class="text-center" cols="3">
        {{ offer.price }}
      </v-col>

      <v-col cols="2">
        <v-btn class="btn btn-success-third" text> 
          <v-icon> mdi-cart-plus </v-icon>
          Add to cart 
        </v-btn>
      </v-col>
    </v-row>
  </v-container>
</template>

<script lang="ts">
import Vue from 'vue'
import { shop } from '@/store'

export default Vue.extend({
  computed: {
    $offers(): { 
      name: string,
      itemId1: number,
      price: number
    }[] {
      return shop.$offers;
    }
  },
})
</script>