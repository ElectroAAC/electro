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
    /**
     * @TODO => Adicionar 1 tratamento para encontrar a imagem e caso não encontre, tratar o erro de forma adequada
     */
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