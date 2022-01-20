<template>
  <v-row class="mt-2">

    <h2> LOGO </h2>
    <v-spacer></v-spacer>
    <h2> {{ $guild.info.name }} </h2> 
    <v-spacer></v-spacer>
    <h2> LOGO </h2>

    <v-col cols="12">
      <GuildInformation />
      <GuildMembers />
    </v-col>

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