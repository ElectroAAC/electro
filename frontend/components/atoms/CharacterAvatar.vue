<template>
  <img :src="require(`~/assets/images/avatars/${getAvatar}.png`)">
</template>

<script lang="ts">
import Vue from 'vue'

export default Vue.extend({
  props: {
    avatar: {
      type: String,
      required: true
    }
  },
  
  data() {
    return {
      image: '',
    }
  },

  computed: {
    getAvatar(): String {

      let defaultImage = "Default"
      let path = `~/assets/img/beer-${this.avatar}.png`
      
      try {
        require(path)
        return this.avatar;
      } catch (e) {
        return defaultImage;
      } 
    },
  },
})
</script>