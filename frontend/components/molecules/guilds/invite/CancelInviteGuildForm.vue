<template>
  <v-container class="text-center pa-5">
    <v-row v-for="(invite, idx) in $invites" :key="idx" class="actions-guild mb-2">
      <v-col style="display: grid; align-items: center;" :cols="!$vuetify.breakpoint.xsOnly ? '8' : '12'"> {{ invite.name }} </v-col>
      <v-col :cols="!$vuetify.breakpoint.xsOnly ? '4' : '12'"> 
        <v-btn 
          text 
          class="btn btn-success-secondary"
        >
          Cancel Invite
        </v-btn>
      </v-col>
    </v-row>
  </v-container>
</template>

<script lang="ts">
import Vue from 'vue'
import { guild } from '@/store'

export default Vue.extend({
  computed: {
    $invites(): { id: Number, name: String}[] {
      return guild.$invites;
    },
  },

  methods: {
    
  }
})
</script>