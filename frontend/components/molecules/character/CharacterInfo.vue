<template>
  <v-container class="text-center">
    Infos
    <v-row>
      <v-col :cols="$device.isDesktop ? '12' : '6'">
        <CharacterAvatar :avatar="getVocation()" width="150px"/>
      </v-col>

      <v-col :cols="$device.isDesktop ? '12' : '6'">
        <v-row>
          <v-col class="pa-1" cols="6">
            Name:
          </v-col>
          <v-col class="pa-1" cols="6">
            {{ getName() }}
          </v-col>

          <v-col class="pa-1" cols="6">
            Level:
          </v-col>
          <v-col class="pa-1" cols="6">
            {{ getLevel() }}
          </v-col>

          <v-col class="pa-1" cols="6">
            Magic Level:
          </v-col>
          <v-col class="pa-1" cols="6">
            {{ getMagicLevel() }}
          </v-col>

          <v-col class="pa-1" cols="6">
            Vocation:
          </v-col>
          <v-col class="pa-1" cols="6">
            {{ getVocation() }}
          </v-col>
        </v-row>
      </v-col>
    </v-row>
  </v-container>
</template>

<script lang="ts">
import Vue from 'vue'
import { character } from '@/store'
import { getVocationName } from '@/utils/methods'

export default Vue.extend({
  computed: {
    $character() {
      return character.$info;
    }
  },

  methods: {
    getName(): String {
      if (this.$character)
        return this.$character?.name;
      return "";
    },

    getLevel(): Number | String {
      if (this.$character)
        return this.$character?.level;
      return "";
    },

    getMagicLevel(): Number | String {
      if (this.$character)
        return this.$character?.maglevel;
      return "";
    },

    getVocation(): String {
      return getVocationName(this.$character.vocation);
    },
  }
})
</script>