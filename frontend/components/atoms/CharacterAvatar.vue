<template>
  <img :src="require(`~/assets/images/avatars/${getAvatar}.png`)">
</template>
<script lang="ts">
export default {
  props: {
    avatar: {
      type: Number,
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
      let path = `@/assets/img/beer-${this.avatar.toString()}.png`
      
      try {
        require(path)
        return this.avatar.toString();
      } catch (e) {
        return defaultImage;
      } 
    },
  },
}
</script>