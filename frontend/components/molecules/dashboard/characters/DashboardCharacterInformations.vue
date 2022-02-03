<template>
  <v-row class="pa-10">
    <v-col :cols="getCols">
      <v-text-field
        v-model="$character.ip"
        label="IP"
        type="text"
        dense
        outlined
        required
        hide-details="auto"
      />
    </v-col>

    <v-col :cols="getCols">
      <v-text-field
        v-model="$character.lastip"
        label="Last IP"
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
        v-model="$character.lastlogin"
        label="Last Login"
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
        v-model="$character.frags"
        label="Frags"
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
        v-model="$character.posx"
        :rules="required"
        label="Pos X"
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
        v-model="$character.posy"
        :rules="required"
        label="Pos Y"
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
        v-model="$character.posz"
        :rules="required"
        label="Pos Z"
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