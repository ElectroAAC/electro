<template>
  <v-data-table
    :headers="getHeaders"
    :items="getPlayersData"
    hide-default-footer
    disable-items-per-page
    no-data-text="No player found"
  >    
    <template #item.name="{ item }">
      <NuxtLink :to="`/character/${item.name}`" class="color-green"> {{ item.name }} </NuxtLink> <br>
    </template>
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
    getPlayersData(this: any): Object[] {
      return this.players_data;
    },
    
    getHeaders(): Object[] {
      return [
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