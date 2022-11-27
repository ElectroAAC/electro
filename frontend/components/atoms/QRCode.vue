<template>
  <img :src="image" alt="QR Code">
</template>

<script lang="ts">
import Vue from 'vue'

export default Vue.extend({
  props: {
    image: {
      type: String,
      required: true
    }
  },
})
</script>