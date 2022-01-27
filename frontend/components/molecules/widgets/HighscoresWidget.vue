<template>
  <aside class="widget">
    <h5 class="widget-title"> Highscores </h5>
    <v-container class="text-center">
      <v-row
        v-for="(player, idx) in $top5Players"
        class="text-center"
        :key="idx"
      >
        <v-col cols="4"> 
          <CharacterAvatar :avatar="getVocation(player.vocation)" width="60px"/>
        </v-col>
        <v-col cols="8">
          <NuxtLink :to="`/character/${player.name}`"> {{ player.name }} </NuxtLink> 
          <br>

          <span> 
            {{ player.level }} 
          </span>
        </v-col>
      </v-row>
    </v-container>
  </aside>
</template>

<script lang="ts">
import Vue from 'vue'
import { top5Players } from '@/store'
import { Top5Players } from '@/models'
import { getVocationName } from '@/utils/methods'

export default Vue.extend({
  computed: {
    $top5Players(): Top5Players[] {
      return top5Players.$topRank;
    }
  },

  mounted() {
    this.getTopRank();
  },

  methods: {
    async getTopRank(): Promise<void> {
      await top5Players.getTopRank();
    },

    getVocation(vocation_id: Number | number): String {
      return getVocationName(vocation_id);
    }
  }
})
</script>