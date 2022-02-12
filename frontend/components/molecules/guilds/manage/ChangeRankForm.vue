<template>
  <v-row class="text-center pa-5">
    Form...
  </v-row>
</template>

<script lang="ts">
import Vue from 'vue'
import { guild } from '@/store'
export default Vue.extend({
  data() {
    return {
      rules: [
        (v: string) => !!v || 'Required field',
      ],
    }
  },

  computed: {
    $guild(): any {
      return guild.$guild;
    }
  }
})
</script>