<template>
  <v-container class="text-center">
    <v-alert
      dense
      outlined
      type="success"
      class="text-center"
    >
      Your purchase was successful! In a few moments the player {{ $toPlayerName }} will receive it. <br>
    </v-alert>
    
    <CartSuccess style="width: 50% !important"/>

    <NuxtLink to="/shop"> Check out our offers! </NuxtLink>
  </v-container>
</template>

<script lang="ts">
import Vue from 'vue'
import { shop } from '@/store'

export default Vue.extend({
  computed: {
    $toPlayerName() {
      return shop.$to_player_name;
    },
  },

  mounted() {
    if (shop.$to_player_name === "") {
      this.$router.replace('/shop');
    }
  }
})
</script>