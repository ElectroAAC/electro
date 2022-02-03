<template>
  <v-row class="pa-10">
    <v-col :cols="getCols">
      <v-text-field
        v-model="$character.level"
        :rules="required"
        label="Level"
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
        v-model="$character.maglevel"
        :rules="required"
        label="Magic Level"
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
        v-model="$character.experience"
        :rules="required"
        label="Experience"
        type="number"
        hide-spin-buttons
        dense
        outlined
        required
        hide-details="auto"
      />
    </v-col>

    <v-col :cols="getCols">
      <v-autocomplete
        v-model="$character.vocation"
        :items="vocationList"
        :rules="required"
        label="Vocation"
        dense
        outlined
        required
        hide-details="auto"
      />
    </v-col>

    <v-col :cols="getCols">
      <v-text-field
        v-model="$character.health"
        :rules="required"
        label="Health"
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
        v-model="$character.healthmax"
        :rules="required"
        label="Max Health"
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
        v-model="$character.mana"
        :rules="required"
        label="Mana"
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
        v-model="$character.manamax"
        :rules="required"
        label="Max Mana"
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
        v-model="$character.cap"
        :rules="required"
        label="Capacity"
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
        v-model="$character.soul"
        :rules="required"
        label="Soul"
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
        v-model="$character.stamina"
        :rules="required"
        label="Stamina"
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
        v-model="$character.offlinetraining_time"
        :rules="required"
        label="Offline Training"
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
import { 
  vocations
} from '@/utils/enum'

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

    vocationList(): Object[] {
      return vocations.map((vocation) => ({
        value: vocation.initial_id,
        text: vocation.text
      }));
    },

    getCols(): String {
      return !this.$vuetify.breakpoint.smAndDown ? '3' : this.$vuetify.breakpoint.smOnly ? '6' : '12';
    }
  }
})
</script>