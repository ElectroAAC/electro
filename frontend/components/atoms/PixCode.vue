<template>
  <v-alert style="word-break: break-word;">
    {{ code }}
  </v-alert>
</template>

<script lang="ts">
import Vue from 'vue'

export default Vue.extend({
  props: {
    code: {
      type: String,
      required: true
    }
  },
})
</script>