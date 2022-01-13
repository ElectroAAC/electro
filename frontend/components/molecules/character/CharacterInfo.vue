<template>
  <v-container class="bg-third text-center">
    Infos
    <v-row>
      <v-col cols="6">
        Name:
      </v-col>
      <v-col cols="6">
        {{ getName() }}
      </v-col>

      <v-col cols="6">
        Level:
      </v-col>
      <v-col cols="6">
        {{ getLevel() }}
      </v-col>

      <v-col cols="6">
        Magic Level:
      </v-col>
      <v-col cols="6">
        {{ getMagicLevel() }}
      </v-col>

      <v-col cols="6">
        Vocation:
      </v-col>
      <v-col cols="6">
        {{ getVocation() }}
      </v-col>
    </v-row>
  </v-container>
</template>

<script lang="ts">
import Vue from 'vue'
import { character } from '@/store'
import { vocations } from '@/utils/enum'

export default Vue.extend({
  computed: {
    $character() {
      return character.$info;
    },
    vocationList() {
      return vocations;
    }
  },

  methods: {
    getName(): String {
      if (this.$character)
        return this.$character?.name;
      return "";
    },

    getLevel(): Number | String{
      if (this.$character)
        return this.$character?.level;
      return "";
    },

    getMagicLevel(): Number | String{
      if (this.$character)
        return this.$character?.maglevel;
      return "";
    },

    getVocation(): String | undefined {
      if (this.$character) {
        return this.vocationList.find((vocation) => vocation.value === this.$character.vocation)?.text;
      }
      return "";
    },
  }
})
</script>