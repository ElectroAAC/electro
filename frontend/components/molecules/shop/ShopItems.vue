<template>
  <v-container>
    <v-row class="pa-0">
      <v-col class="header-table text-center" cols="6">
        Product
      </v-col>

      <v-col class="header-table text-center" cols="3">
        Price
      </v-col>

      <v-col cols="3" />
    </v-row>
    
    <v-row v-if="!$offers.length" class="text-center">
      There are no offers in this category.
    </v-row>

    <v-row 
      v-for="(offer, idx) in $offers" 
      :key="idx"
      v-else
      class="pa-0"
    > 
      <v-col class="text-center" cols="6">
        <ItemImage :image="offer.itemId1" :image_name="offer.name"/>
        {{ offer.name }}
      </v-col>

      <v-col class="text-center" cols="3">
        {{ offer.price }}
      </v-col>

      <v-col cols="3">
        <v-btn 
          :class="`${$vuetify.breakpoint.smAndDown ? 'btn-mobile' : 'btn'} btn-success-third`" 
          text
          @click="addToCart(offer)"
        > 
          <v-icon> mdi-cart-plus </v-icon>
          <span v-if="!$vuetify.breakpoint.xsOnly"> Add to cart </span> 
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

  methods: {
    addToCart(offer: any) {
      shop.$cart.push({
        offer_id: offer.id,
        item_id: offer.itemId1,
        name: offer.name,
        description: offer.description,
        amount: offer.count1,
        price: offer.price,
        originalPrice: offer.price
      });

      this.$toast.success(
        `The product ${offer.name} has been added to the cart.`,
        {
          keepOnHover: true,
          duration: 2000,
          theme: "bubble",
        }
      )
    }
  }
})
</script>