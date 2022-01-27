<template>
  <v-container>
    <v-row>
      <v-col class="text-center" cols="12"> {{ title }} </v-col>
      <v-col cols="12"> <v-btn 
          text 
          class="btn btn-success-secondary"
        >
          <a :href="link" target="_blank"> Download</a>
        </v-btn> </v-col>
    </v-row>
  </v-container>
</template>

<script lang="ts">
import Vue from 'vue'
export default Vue.extend({
  props: {
    link: {
      type: String,
      default: "",
    },
    title: {
      type: String,
      default: ""
    }
  }
})
</script>