<template>
  <img :src="getUrl" alt="Character Outfit">
</template>

<script lang="ts">
import Vue from 'vue'

export default Vue.extend({
  props: {
    look_type: {
      type: Number,
      default: 1
    },
    look_addons: {
      type: Number,
      default: 1
    },
    look_head: {
      type: Number,
      default: 1
    },
    look_body: {
      type: Number,
      default: 1
    },
    look_legs: {
      type: Number,
      default: 1
    },
    look_feet: {
      type: Number,
      default: 1
    }
  },

  data() {
    return {
      url: ""
    }
  },

  computed: {
    getUrl() {
      return `${process.env.OUTFITS_IMAGES_URL}?id=${this.look_type}&addons${this.look_addons}&head=${this.look_head}&body=${this.look_body}&legs=${this.look_legs}&feet=${this.look_feet}`;
    }
  },
})
</script>