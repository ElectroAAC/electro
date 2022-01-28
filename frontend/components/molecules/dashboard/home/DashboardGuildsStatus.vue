<template>
  <v-container class="dashboard-container">
    <v-row class="pa-0">
      <v-col v-if="!$vuetify.breakpoint.mdAndDown" cols="4" class="text-center">
        <v-icon size="96">
          mdi-khanda
        </v-icon>
      </v-col>

      <v-col :cols="!$vuetify.breakpoint.mdAndDown ? '8' : '12'" class="d-flex justify-center align-center flex-wrap text-center">
        <v-col cols="12"> 
          <h2 v-if="!$vuetify.breakpoint.mdAndDown"> Total Guilds </h2> 
          <h3 v-else> Total Guilds </h3> 
        </v-col>
        <h3> {{ getTotalGuilds }} </h3>
      </v-col>
    </v-row>
  </v-container>
</template>

<script lang="ts">
import Vue from 'vue'
export default Vue.extend({
  props: {
    total_guilds: {
      type: Number,
      default: 0
    }
  },

  computed: {
    getTotalGuilds(): Number {
      return this.total_guilds;
    }
  }
})
</script>