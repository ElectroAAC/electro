<template>
  <img :src="getUrl" :alt="image_name" @error="url = 'default'">
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

  data() {
    return {
      url: ""
    }
  },

  computed: {
    getImage() {
      if (this.url === "") {
        this.url = this.image.toString().toLowerCase();
        return this.url;
      }
      return this.url;
    },
    getUrl() {
      return `${process.env.ITEM_IMAGES_URL}/${this.getImage}.png`;
    }
  },
})
</script>