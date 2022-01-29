<template>
  <div>
    <h3 class="mb-4"> Account characters </h3>

    <v-row 
      v-for="(character, idx) in getCharacters" 
      :key="idx"
    >
      <v-col class="pa-1" cols="8"> {{ character.name }} </v-col>
      <v-col class="pa-1" cols="4"> 
        <v-tooltip bottom>
          <template #activator="{ on, attrs }">
            <v-btn
              icon
              v-bind="attrs"
              v-on="on"
            >
              <v-icon color="white"> mdi-eye </v-icon>
            </v-btn>
          </template>
          <span>Edit Character</span>
        </v-tooltip>
      </v-col>
    </v-row>
  </div>
</template>

<script lang="ts">
import Vue from 'vue'
import { dashboardAccounts } from '@/store'

export default Vue.extend({
  computed: {
    getCharacters(): { name: string }[] {
      return dashboardAccounts.$characters;
    }
  }
})
</script>