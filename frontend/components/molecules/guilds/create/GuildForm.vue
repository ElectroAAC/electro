<template>
  <v-row>
    <v-col cols="6">
      <v-autocomplete
        v-model="guild.character_id"
        :rules="required"
        :items="characterList"
        label="Character"
        validate-on-blur
        dense
        outlined
        hide-details="auto"
      />
    </v-col>

    <v-col cols="6">
      <v-text-field
        v-model="guild.name"
        :rules="required"
        label="Guild Name"
        type="text"
        validate-on-blur
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
import { Accounts } from '@/models'

export default Vue.extend({
  data() {
    return {
      guild: {
        name: "",
        character_id: 0
      },
      required: [
        (v: string) => !!v || 'Required field',
      ],
    }
  },

  computed: {
    $account(): Accounts {
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

  methods: { }
})
</script>

<style lang="scss" scoped>
.theme--light.v-list {
  background: #212358fa !important;
  color: var(--heading-color) !important;
}
</style>