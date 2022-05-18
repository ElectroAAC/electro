<template>
  <v-container>
    <v-btn 
      v-for="(categorie, idx) in $categories" 
      :key="idx"
      text
      class="ml-3 btn btn-success-primary"
      @click="changeCategorie(categorie.name)"
    > 
      {{ categorie.name.toUpperCase() }}
    </v-btn>
  </v-container>
</template>

<script lang="ts">
import Vue from 'vue'
import { shop, shopCategorie } from '@/store'

export default Vue.extend({
  computed: {
    $categories(): { name: string }[] {
      return shopCategorie.$categories;
    }
  },

  methods: {
    async changeCategorie(category_name: string): Promise<void> {
      await shop.getOffers(category_name);
    }
  }
})
</script>