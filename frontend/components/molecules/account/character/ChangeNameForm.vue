<template>
  <v-row>
    <v-col cols="6">
      <v-autocomplete
        :value="change.character_id"
        :rules="required"
        :items="characterList"
        label="Character"
        validate-on-blur
        dense
        outlined
        hide-details="auto"
        @change="($event) => {
          change.character_id = $event;
          setNewName();
        }"
      />
    </v-col>

    <v-col cols="6">
      <v-text-field
        :value="change.new_name"
        :rules="required"
        label="New Character Name"
        type="text"
        validate-on-blur
        dense
        outlined
        required
        hide-details="auto"
        @input="($event) => {
          change.new_name = $event;
          setNewName();
        }"
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
      change: {
        new_name: "",
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

  methods: {
    setNewName(this: any): void {
      account.setNewName(this.change);
    }
  }
})
</script>

<style lang="scss" scoped>
.theme--light.v-list {
  background: #212358fa !important;
  color: var(--heading-color) !important;
}
</style>