<template>
  <v-row class="mt-2">

    OOOOOOOOOOOOOOOOOOOOOOOLA

    <v-col class="text-center" cols="12">
      <v-btn 
        text 
        class="btn btn-success-secondary"
        @click="back"
      >
        Voltar
      </v-btn>
    </v-col>
  </v-row>
</template>

<script lang="ts">
import Vue from 'vue'
import { guild } from '@/store'

export default Vue.extend({
  computed: {
    $guild() {
      return guild.$guild;
    }
  },

  methods: {
    back() {
      this.$router.replace('/guilds');
    }
  }
})
</script>