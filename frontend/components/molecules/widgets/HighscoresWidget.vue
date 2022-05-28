<template>
  <aside class="widget">
    <h5 class="widget-title"> <span> Highscores </span> </h5>

    <v-container class="text-center">
      <v-row
        v-for="(player, idx) in $top5Players"
        class="text-center"
        :key="idx"
      >
        <v-col class="pa-1" cols="4"> 
          <NuxtLink :to="`/character/${player.name}`">
            <AnimatedOutfit 
              :look_type="player.looktype"
              :look_addons="player.lookaddons"
              :look_head="player.lookhead"
              :look_body="player.lookbody"
              :look_legs="player.looklegs"
              :look_feet="player.lookfeet"
            />
          </NuxtLink>
        </v-col>

        <v-col class="pa-1" style="display: grid; align-items: center;" cols="8">
          <NuxtLink :to="`/character/${player.name}`" class="highscores-title color-orange"> {{ player.name }} </NuxtLink> 

          <span class="bold"> 
            Level: ({{ player.level }})
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