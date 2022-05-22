<template>
  <v-container>
    <v-row>
      <v-col class="text-center" cols="12"> {{ title }} </v-col>
      <v-col cols="12"> 
        <a :href="link" target="_blank"> 
          <DownloadAnimated style="width: 20%;"/> 
        </a> 
      </v-col>
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