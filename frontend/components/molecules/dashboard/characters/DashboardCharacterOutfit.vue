<template>
  <v-row class="pa-10">
    <v-col :cols="getCols">
      <v-text-field
        v-model="$character.looktype"
        :rules="required"
        label="Look Type"
        type="number"
        hide-spin-buttons
        dense
        outlined
        required
        hide-details="auto"
      />
    </v-col>

    <v-col :cols="getCols">
      <v-text-field
        v-model="$character.lookaddons"
        label="Look Addons"
        type="number"
        hide-spin-buttons
        dense
        outlined
        required
        hide-details="auto"
      />
    </v-col>

    <v-col :cols="getCols">
      <v-text-field
        v-model="$character.lookhead"
        label="Look Head"
        type="number"
        hide-spin-buttons
        dense
        outlined
        required
        hide-details="auto"
      />
    </v-col>

    <v-col :cols="getCols">
      <v-text-field
        v-model="$character.lookbody"
        label="Look Body"
        type="number"
        hide-spin-buttons
        dense
        outlined
        required
        hide-details="auto"
      />
    </v-col>

    <v-col :cols="getCols">
      <v-text-field
        v-model="$character.looklegs"
        label="Look Legs"
        type="number"
        hide-spin-buttons
        dense
        outlined
        required
        hide-details="auto"
      />
    </v-col>

    <v-col :cols="getCols">
      <v-text-field
        v-model="$character.lookfeet"
        label="Look Feet"
        type="number"
        hide-spin-buttons
        dense
        outlined
        required
        hide-details="auto"
      />
    </v-col>
  </v-row>
</template>

<script lang="ts">
import Vue from 'vue'
import { dashboardCharacters } from '@/store'
import { Character } from '@/models'

export default Vue.extend({
  data() {
    return {
      required: [
        (v: string) => !!v || 'Required field',
      ],
    }
  },

  computed: {
    $character(): Character {
      return dashboardCharacters.$character;
    },

    getCols(): String {
      return !this.$vuetify.breakpoint.smAndDown ? '4' : this.$vuetify.breakpoint.smOnly ? '6' : '12';
    }
  }
})
</script>