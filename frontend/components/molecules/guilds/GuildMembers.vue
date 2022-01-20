<template>
  <v-container>
    <!-- Rank	Name and Title	Vocation	Level	Status -->
    <v-row class="text-center">
      <v-col class="title" cols="2"> Rank </v-col>
      <v-col class="title" cols="4"> Name </v-col>
      <v-col class="title" cols="2"> Vocation </v-col>
      <v-col class="title" cols="2"> Level </v-col>
      <v-col class="title" cols="2"> Status </v-col>

      <v-col class="text-center" cols="12">
        <v-row 
          v-for="(member, idx) in $guild.guild_members"
          class="text-center"
          :key="idx"
        >
          <v-col cols="2"> {{ member.rank_name }} </v-col>
          <v-col cols="4" class="member-name"> <NuxtLink :to="`/character/${member.name}`"> {{ member.name }} </NuxtLink> </v-col>
          <v-col cols="2"> {{ getVocation(member.vocation) }} </v-col>
          <v-col cols="2"> {{ member.player_level }} </v-col>
          <v-col :class="`color-${member.online === 1 ? 'green' : 'red'}`" cols="2"> {{ member.online === 1 ? 'Online' : 'Offline' }} </v-col>
        </v-row>
      </v-col>
    </v-row>
  </v-container>
</template>

<script lang="ts">
import Vue from 'vue'
import { guild } from '@/store'
import { getVocationName } from '@/utils/methods'

export default Vue.extend({
  computed: {
    $guild() {
      return guild.$guild;
    }
  },

  methods: {
    getVocation(vocation_id: number): String {
      return getVocationName(vocation_id) !== "Default" ? getVocationName(vocation_id) : "";
    }
  }
})
</script>

<style lang="scss" scoped>
.v-application a { 
  text-decoration: none !important;
}
</style>