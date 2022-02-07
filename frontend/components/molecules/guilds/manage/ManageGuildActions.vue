<template>
  <v-container>
    <v-row v-if="!$vuetify.breakpoint.xsOnly" class="text-center pa-1">
      <v-col cols="4">
        Action
      </v-col>

      <v-col cols="8">
        Description
      </v-col>
    </v-row>

    <v-row 
      v-for="(action, idx) in getActions"
      :key="idx"
      class="text-center pa-1" 
      align="center"
    >
      <v-col class="pa-1 text-center" :cols="getColsAction">
        <v-btn 
          text 
          class="btn btn-success-secondary"
        >
          {{ action.text }}
        </v-btn>
      </v-col>

      <v-col  v-if="!$vuetify.breakpoint.xsOnly" class="pa-1" :cols="getColsDescription">
        {{ action.description }}
      </v-col>
    </v-row>
  </v-container>
</template>

<script lang="ts">
import Vue from 'vue'
import { guildActions } from '@/utils/enum'

export default Vue.extend({
  computed: {
    getActions() {
      return guildActions;
    },

    getColsAction() {
      return this.$vuetify.breakpoint.xsOnly ? '12' : '4';
    },
    getColsDescription() {
      return this.$vuetify.breakpoint.xsOnly ? '12' : '8';
    }
  }
})
</script>