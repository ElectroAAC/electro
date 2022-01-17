<template>
  <v-row>
    <v-col cols="6">
      <v-autocomplete
        v-model="change.character_id"
        :rules="required"
        :items="characterList"
        label="Character"
        dense
        outlined
        hide-details="auto"
      />
    </v-col>

    <v-col cols="6">
      <v-text-field
        v-model="change.new_name"
        :rules="required"
        label="New Character Name"
        type="text"
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
import { account } from '@/store'

export default Vue.extend({
  data() {
    return {
      change: {
        character_id: null,
        new_name: ""
      },
      required: [
        (v: string) => !!v || 'Required field',
      ],
    }
  },

  computed: {
    $account(): Object {
      return account.$account;
    },

    $characters(): Object[] {
      return account.$characters;
    },

    characterList(): Object[] {
      return this.$characters.map((character: any) => ({
        value: character.id,
        text: character.name
      }))
    }
  },

  mounted() {
    if (!this.$characters.length) {
      account.getCharacters(this.$account.id);
    }
  },
})
</script>

<style lang="scss" scoped>
.theme--light.v-list {
  background: #212358fa !important;
  color: var(--heading-color) !important;
}
</style>