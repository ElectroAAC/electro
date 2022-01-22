<template>
  <v-container>
    <v-row class="text-center">
      <v-col class="text-center" cols="12">
        <h3> Select Vocation: </h3>
      </v-col>
      <v-radio-group
        v-model="onboarding"
        row
      >
        <v-radio
          v-for="(vocation, idx) in getVocationList" :key="idx"
          :label="vocation.text"
          :value="vocation.value"
        ></v-radio>
      </v-radio-group>
    </v-row>
  </v-container>
</template>

<script lang="ts">
import Vue from 'vue'
import { createCharacter } from '@/store'
import { vocations } from '@/utils/enum'

export default Vue.extend({
  data() {
    return {
      onboarding: 1,
    }
  },
  
  computed: {
    getVocationList(): { value: number, text: string}[] {
      return vocations.map((vocation) => ({
        value: vocation.initial_id,
        text: vocation.text
      }))
    },
  },
  
  watch: {
    onboarding(v) {
      createCharacter.update({ vocation: v });
    }
  },
})
</script>