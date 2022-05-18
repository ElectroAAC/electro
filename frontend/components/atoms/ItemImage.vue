<template>
  <img :src="getImage" :alt="image_name" @error="error">
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

  computed: {
    getImage() {
      // Return nothing for the default empty string
      if (!this.image_name) {
        return require('~/assets/images/items/default.gif');
      }

      const fileName = this.image.toString().toLowerCase();

      // Request the image as a webpack module by using `require`
      if (require(`~/${process.env.ITEM_IMAGES_URL}/${fileName}.gif`))
        return require(`~/${process.env.ITEM_IMAGES_URL}/${fileName}.gif`);
      else
        return require('~/assets/images/items/default.gif');
    },

    error() {
      this.image = '~/assets/images/items/default.gif';
    }
  },
})
</script>