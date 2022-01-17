<template>
  <v-row>
    <v-col cols="6">
      <v-autocomplete
        :value="character.character_id"
        :rules="required"
        :items="characterList"
        label="Character"
        validate-on-blur
        dense
        outlined
        hide-details="auto"
        @change="($event) => {
          character.character_id = $event;
          setDeleteCharacter();
        }"
      />
    </v-col>

    <v-col cols="6">
      <v-text-field
        :value="character.password"
        :rules="required"
        label="Password"
        validate-on-blur
        dense
        outlined
        required
        hide-details="auto"
        :type="showPassword ? 'text' : 'password'"
        :append-icon="showPassword ? 'mdi-eye' : 'mdi-eye-off'"
        @click:append="showPassword = !showPassword"
        @change="($event) => {
          character.password = $event;
          setDeleteCharacter();
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
      character: {
        password: "",
        character_id: 0
      },
      showPassword: false,
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
    setDeleteCharacter(this: any): void {
      account.setPasswordToDelete(this.character);
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