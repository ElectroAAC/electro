<template>
  <v-container>
    <v-select 
      v-if="$vuetify.breakpoint.smAndDown"
      :value="$categories[0]"
      :items="$categories"
      :menu-props="{ bottom: true, offsetY: true }"
      return-object
      outlined
      dense
      hide-details
      @change="($event) => {
        changeCategorie($event.text)
      }"
    />

    <v-btn 
      v-for="(categorie, idx) in $categories"
      v-else
      :key="idx"
      text
      class="ml-3 btn btn-success-primary"
      @click="changeCategorie(categorie.text)"
    > 
      {{ categorie.text.toUpperCase() }}
    </v-btn>
  </v-container>
</template>

<script lang="ts">
import Vue from 'vue'
import { shop, shopCategorie } from '@/store'

export default Vue.extend({
  computed: {
    $categories(): { value: number, text: string }[] {
      return shopCategorie.$categories.map((category: any) => ({ 
        value: category.id, text: category.name 
        })
      );
    }
  },

  methods: {
    async changeCategorie(category_name: string): Promise<void> {
      await shop.getOffers(category_name);
    }
  }
})
</script>