<template>
  <v-container class="dashboard-container">
    <v-row class="pa-0">
      <v-col cols="4" class="text-center">
        <v-icon size="96" color="cyan">
          mdi-human-greeting-proximity
        </v-icon>
      </v-col>

      <v-col cols="7" class="d-flex justify-center align-center flex-wrap text-center">
        <h2> Total Players </h2>
        <h3> {{ getTotalPlayers }} </h3>
      </v-col>
    </v-row>
  </v-container>
</template>

<script lang="ts">
import Vue from 'vue'
export default Vue.extend({
  props: {
    total_players: {
      type: Number,
      default: 0
    }
  },

  computed: {
    getTotalPlayers(): Number {
      return this.total_players;
    }
  }
})
</script>