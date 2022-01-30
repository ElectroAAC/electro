<template>
  <v-row class="pa-10">
    <v-col :cols="!$vuetify.breakpoint.smAndDown ? '4' : $vuetify.breakpoint.smOnly ? '6' : '12'">
      <v-text-field
        v-model="$character.account_id"
        :rules="required"
        label="Account Id"
        type="number"
        hide-spin-buttons
        dense
        outlined
        required
        hide-details="auto"
      />
    </v-col>
    
    <v-col :cols="!$vuetify.breakpoint.smAndDown ? '4' : $vuetify.breakpoint.smOnly ? '6' : '12'">
      <v-text-field
        v-model="$character.name"
        :rules="required"
        label="Player Name"
        type="text"
        dense
        outlined
        required
        hide-details="auto"
      />
    </v-col>

    <v-col :cols="!$vuetify.breakpoint.smAndDown ? '4' : $vuetify.breakpoint.smOnly ? '6' : '12'">
      <v-autocomplete
        v-model="$character.group_id"
        :items="characterGroups"
        label="Group ID"
        dense
        outlined
        required
        hide-details="auto"
      />
    </v-col>

    <v-col :cols="!$vuetify.breakpoint.smAndDown ? '4' : $vuetify.breakpoint.smOnly ? '6' : '12'">
      <v-autocomplete
        v-model="$character.sex"
        :items="sexList"
        label="Sex"
        dense
        outlined
        required
        hide-details="auto"
      />
    </v-col>

    <v-col :cols="!$vuetify.breakpoint.smAndDown ? '4' : $vuetify.breakpoint.smOnly ? '6' : '12'">
      <v-text-field
        v-model="$character.town_id"
        label="Town"
        type="text"
        dense
        outlined
        required
        hide-details="auto"
      />
    </v-col>

    <v-col :cols="!$vuetify.breakpoint.smAndDown ? '4' : $vuetify.breakpoint.smOnly ? '6' : '12'">
      <v-autocomplete
        v-model="$character.skull"
        :items="skullList"
        label="Skull"
        dense
        outlined
        required
        hide-details="auto"
      />
    </v-col>

    <v-col :cols="!$vuetify.breakpoint.smAndDown ? '4' : $vuetify.breakpoint.smOnly ? '6' : '12'">
      <v-text-field
        v-model="$character.skulltime"
        label="Skulltime"
        type="number"
        hide-spin-buttons
        dense
        outlined
        required
        hide-details="auto"
      />
    </v-col>

    <v-col :cols="!$vuetify.breakpoint.smAndDown ? '4' : $vuetify.breakpoint.smOnly ? '6' : '12'">
      <v-text-field
        v-model="$character.blessings"
        label="Blessings"
        type="text"
        dense
        outlined
        required
        hide-details="auto"
      />
    </v-col>

    <v-col :cols="!$vuetify.breakpoint.smAndDown ? '4' : $vuetify.breakpoint.smOnly ? '6' : '12'">
      <v-text-field
        v-model="$character.balance"
        label="Bank Balance"
        type="text"
        dense
        outlined
        required
        hide-details="auto"
      />
    </v-col>

    <v-col :cols="!$vuetify.breakpoint.smAndDown ? '4' : '6'">
      <v-checkbox
        :value="$character.hidden === 1"
        class="ma-2 pa-0"
        color="primary"
        label="Hidden"
        hide-details
        @change="($event) => {
          $character.hidden = $event === 1 ? 1 : 0;
        }"
      />
    </v-col>

    <v-col :cols="!$vuetify.breakpoint.smAndDown ? '4' : '6'">
      <v-checkbox
        :value="$character.deleted === 1"
        class="ma-2 pa-0"
        color="primary"
        label="Deleted"
        hide-details
        @change="($event) => {
          $character.deleted = $event === 1 ? 1 : 0;
        }"
      />
    </v-col>
  </v-row>
</template>

<script lang="ts">
import Vue from 'vue'
import { dashboardCharacters } from '@/store'
import { Character } from '@/models'
import { 
  characterGroups, 
  sex,
  skulls 
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

    characterGroups(): Object[] {
      return characterGroups;
    },

    sexList(): Object[] {
      return sex;
    },

    skullList(): Object[] {
      return skulls;
    }
  }
})
</script>