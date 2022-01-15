<template>
  <aside class="widget">
    <h5 class="widget-title"> Highscores </h5>
    <v-container class="text-center">
      <div
        v-for="(player, idx) in $highscores"
        :key="idx"
      >
        <CharacterAvatar :avatar="getVocationName(player.vocation)" width="60px"/> <br>
        <span> <NuxtLink :to="`/character/${player.name}`"> {{ player.name }} </NuxtLink> </span> <br>
        <span> {{ player.level }} </span>
      </div>
    </v-container>
  </aside>
</template>

<script lang="ts">
import Vue from 'vue'
import { highscores } from '@/store'
import { HighscoresWidget } from '@/models'
import { vocations } from '@/utils/enum'

export default Vue.extend({
  computed: {
    $highscores(): HighscoresWidget[] {
      return highscores.$topRank;
    }
  },

  mounted() {
    this.getTopRank();
  },

  methods: {
    async getTopRank(): Promise<void> {
      await highscores.getTopRank();
    },

    getVocationName(vocation_id: Number | number): String | undefined {
      const vocation = vocations.find((vocation) => vocation.value === vocation_id)?.text;
      if (vocation)
        return vocation;
      return "Default";
    }
  }
})
</script>