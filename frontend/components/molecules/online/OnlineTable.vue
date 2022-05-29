<template>
  <v-data-table
    :headers="getHeaders"
    :items="getPlayersData"
    mobile-breakpoint="0"
    hide-default-footer
    disable-items-per-page
    no-data-text="No player found"
  >    
    <!-- eslint-disable-next-line vue/valid-v-slot -->
    <template #item.outfit="{ item }">
      <AnimatedOutfit 
        :look_type="item.looktype"
        :look_addons="item.lookaddons"
        :look_head="item.lookhead"
        :look_body="item.lookbody"
        :look_legs="item.looklegs"
        :look_feet="item.lookfeet"
      />
    </template>

    <!-- eslint-disable-next-line vue/valid-v-slot -->
    <template #item.name="{ item }">
      <NuxtLink :to="`/character/${item.name}`" class="color-green"> {{ item.name }} </NuxtLink> <br>
    </template>

    <!-- eslint-disable-next-line vue/valid-v-slot -->
    <template #item.vocation="{ item }">
      {{ getVocation(item.vocation) }}
    </template>
  </v-data-table>
</template>

<script lang="ts">
import Vue from 'vue'
import { getVocationName } from '@/utils/methods'

export default Vue.extend({
  props: {
    players_data: {
      type: Array,
      default: () => []
    }
  },

  data() {
    return {
      footerProps: {
        "items-per-page-options": [25, 50, 100, 150],
        "items-per-page-text": "Players per page",
      },
    }
  },

  computed: {
    getPlayersData(this: any): any[] {
      return this.players_data;
    },
    
    getHeaders(): Object[] {
      return [
        { text: 'Outfit', value: 'outfit', align: 'center', sortable: false },
        { text: 'Name', value: 'name', align: 'center' },
        { text: 'Level', value: 'level', align: 'center' },
        { text: 'Vocation', value: 'vocation', align: 'center'},
      ];
    }
  },

  methods: {
    getVocation(vocation_id: number): String {
      return getVocationName(vocation_id) !== "Default" ? getVocationName(vocation_id) : "";
    }}
})
</script>