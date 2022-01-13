<template>
  <aside class="widget">
    <h5 class="widget-title"> Highscores </h5>
    <v-container class="text-center">
      <div
        v-for="(player, idx) in $highscores"
        :key="idx"
      >
        <CharacterAvatar :avatar="player.vocation" width="60px"/> <br>
        <span> <NuxtLink :to="`/character/${player.name}`"> {{ player.name }} </NuxtLink> </span> <br>
        <span> {{ player.level }} </span>
      </div>
    </v-container>
  </aside>
</template>

<script lang="ts">
import Vue from 'vue'
import { highscores } from '@/store'

export default Vue.extend({
  computed: {
    $highscores(): Object[] {
      return highscores.$topRank;
    }
  },

  mounted() {
    this.getTopRank();
  },

  methods: {
    async getTopRank(): Promise<void> {
      await highscores.getTopRank();
    }
  }
})
</script>