<template>
  <img :src="require(`~/assets/images/vocations/${getAvatar}.png`)" width="450px" height="450px">
</template>

<script lang="ts">
import Vue from 'vue'

export default Vue.extend({
  props: {
    vocation_name: {
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
      return this.vocation_name;
    },
  },
})
</script>