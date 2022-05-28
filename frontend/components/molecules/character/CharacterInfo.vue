<template>
  <div class="character-informations text-center">
    <v-row class="ma-0 pa-0">
      <v-col class="pb-0" cols="12"> <h3> Informations </h3> </v-col>
      
      <v-col class="pt-0 pb-0" cols="12">
        <AnimatedOutfit 
          :look_type="$character.looktype"
          :look_addons="$character.lookaddons"
          :look_head="$character.lookhead"
          :look_body="$character.lookbody"
          :look_legs="$character.looklegs"
          :look_feet="$character.lookfeet"
        />
      </v-col>

      <v-col cols="12">
        <v-row class="pa-0 ma-0">
          <v-col class="bold pa-1" cols="6">
            Name:
          </v-col>
          <v-col class="bold color-orange pa-1" cols="6">
            {{ getName() }}
          </v-col>

          <v-col class="bold pa-1" cols="6">
            Level:
          </v-col>
          <v-col class="bold color-orange pa-1" cols="6">
            {{ getLevel() }}
          </v-col>

          <v-col class="bold pa-1" cols="6">
            Magic Level:
          </v-col>
          <v-col class="bold color-orange pa-1" cols="6">
            {{ getMagicLevel() }}
          </v-col>

          <v-col class="bold pa-1" cols="6">
            Vocation:
          </v-col>
          <v-col class="bold color-orange pa-1" cols="6">
            {{ getVocation() }}
          </v-col>
        </v-row>
      </v-col>
    </v-row>
  </div>
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