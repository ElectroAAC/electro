<template>
  <v-img :src="require(`~/assets/images/avatars/${getAvatar}.png`)" :max-width="getWidth">
    <div width="100%">
      <v-card flat color="transparent" width="100%">
        <v-card-text class="white--text font-weight-black"></v-card-text>
        <v-card-subtitle class="white--text"></v-card-subtitle>
      </v-card>
    </div>
    <div class="d-flex text-center character-avatar-name" width="100%">
      <div class="pa-0"> {{ getLevel }} - {{ getText }} </div>
    </div>
  </v-img>
</template>

<script lang="ts">
import Vue from 'vue'

export default Vue.extend({
  props: {
    avatar: {
      type: String,
      required: true
    },
    text: {
      type: String,
      default: ""
    },
    level: {
      type: Number,
      default: 123
    },
    width_image: {
      type: String,
      default: ""
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
    getText(): String {
      if (this.text.length > 10)
        return this.text.substr(0, 10) + "...";
      else
        return this.text;
    },
    getLevel(): Number {
      return this.level;
    },
    getWidth(): String {
      return this.width_image;
    }
  },
})
</script>