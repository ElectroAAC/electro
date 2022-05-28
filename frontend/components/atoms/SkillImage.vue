<template>
  <img 
    :src="require(`~/assets/images/skills/${image.toString()}.gif`)"
    width="32"
    height="32"
    style="border: 1px solid var(--second-color);"
  />
</template>

<script lang="ts">
import Vue from 'vue'

export default Vue.extend({
  props: {
    image: {
      type: Number,
      required: true
    },
    image_name: {
      type: String,
      required: true
    }
  },
})
</script>