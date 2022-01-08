<template>
  <img :src="require(`~/assets/images/${mini ? 'mini-logo' : 'logo'}.png`)">
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