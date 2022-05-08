<template>
  <v-row>
    <v-col cols="8">
      <v-text-field
        :value="character.name"
        :rules="required"
        label="Character Name"
        type="text"
        color="var(--main-color)"
        dense
        outlined
        rounded
        required
        hide-details="auto"
        @change="($event) => {
          character.name = $event;
          updateCharacter();
        }"
      />
    </v-col>

    <v-col cols="4">
      <v-autocomplete
        :value="
          getSexList.some((item) => item.value === character.sex)
            ? {
                value: character.sex,
                text: getSexList.find(
                  (item) => item.value === character.sex,
                ).text
              }
            : 0"
        :rules="required"
        :items="getSexList"
        class="character-sex-list"
        label="Sex"
        color="var(--main-color)"
        dense
        rounded
        outlined
        hide-details="auto"
        @change="($event) => {
          character.sex = $event;
          updateCharacter();
        }"
      />
    </v-col>
  </v-row>
</template>

<script lang="ts">
import Vue from 'vue'
import { createCharacter } from '@/store'
import { CreateCharacter } from '@/models'
import { sex as sexList } from '@/utils/enum'

export default Vue.extend({
  data() {
    return {
      character: {
        name: "",
        sex: 0
      },
      required: [
        (v: string) => !!v || 'Required field',
      ],
    }
  },

  computed: {
    $character(): CreateCharacter {
      return createCharacter.$character;
    },
    getSexList(): { value: number, text: string }[] {
      return sexList;
    },
  },

  methods: {
    updateCharacter(this: any) {
      createCharacter.update(this.character);
    },
  }
})
</script>

<style lang="scss" scoped>
.theme--light.v-list {
  background: transparent !important;
  color: var(--heading-color) !important;
}
</style>