<template>
  <img :src="require('~/assets/images/create-account.png')">
</template>

<script lang="ts">
import Vue from 'vue'
export default Vue.extend({
  props: {
    mini: {
      type: Boolean,
      default: false
    }
  }
})
</script>