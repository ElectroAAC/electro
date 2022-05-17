<template>
  <v-container>
    Categories: {{ $categories }}
  </v-container>
</template>

<script lang="ts">
import Vue from 'vue'
import { shopCategorie } from '@/store'

export default Vue.extend({
  computed: {
    $categories(): Object[] {
      return shopCategorie.$categories;
    }
  }
})
</script>