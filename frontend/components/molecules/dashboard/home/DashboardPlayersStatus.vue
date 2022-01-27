<template>
  <v-container class="dashboard-container">
    <v-row class="pa-0">
      <v-col v-if="!$vuetify.breakpoint.mdAndDown" class="text-center">
        <v-icon size="96">
          mdi-human-greeting-proximity
        </v-icon>
      </v-col>

      <v-col :cols="!$vuetify.breakpoint.mdAndDown ? '8' : '12'" class="d-flex justify-center align-center flex-wrap text-center">
        <v-col cols="12"> 
          <h2 v-if="!$vuetify.breakpoint.mdAndDown"> Total Players </h2> 
          <h3 v-else> Total Players </h3> 
        </v-col>
        <h3 color="cyan"> {{ getTotalPlayers }} </h3>
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