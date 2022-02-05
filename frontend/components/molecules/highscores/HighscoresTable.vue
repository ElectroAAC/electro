<template>
  <v-data-table
    :headers="getHeaders"
    :items="playersData"
    :footer-props="footerProps"
    :options.sync="options"
    :server-items-length="total"
    :items-per-page="25"
    :loading="isLoadingGrid"
    disable-items-per-page
    mobile-breakpoint="0"
    loading-text="Loading Player List..."
    no-data-text="No player found"
  >
    <template #item.position="{ index }">
      {{ index+1 }}
    </template>
    
    <template #item.name="{ item }">
      <NuxtLink :to="`/character/${item.name}`" :class="`color-${item.online === 1 ? 'green' : 'red'}`"> {{ item.name }} </NuxtLink> <br>
      {{ getVocation(item.vocation) }}
    </template>
  </v-data-table>
</template>

<script lang="ts">
import Vue from 'vue'
import { ranking } from '@/store'
import { getVocationName } from '@/utils/methods'

export default Vue.extend({
  data() {
    return {
      footerProps: {
        "items-per-page-options": [25, 50, 100, 150],
        "items-per-page-text": "Players per page",
      },
      isLoadingGrid: true,
      playersData: [],
      options: {},
      total: 0,
    }
  },

  computed: {
    $type(): string {
      return ranking.$type;
    },

    getHeaders(): Object[] {
      const items = [
        { text: 'Rank', value: 'position', align: 'center', sortable: false },
        { text: 'Name', value: 'name', align: 'center', sortable: false },
      ];

      if (this.$type === "Experience") {
        items.push(
          { text: 'Level', value: 'level', align: 'center', sortable: false }, 
          { text: 'Experience', value: 'experience', align: 'center d-none d-sm-table-cell', sortable: false }
        )
      } else if (this.$type === "Frags") {
        items.push({ text: 'Frags', value: 'value', align: 'center', sortable: false })
      }
      else {
        items.push({ text: 'Skill', value: 'value', align: 'center', sortable: false })
      }

      return items;
    },
  },

  watch: {
    options: {
      handler () {
        this.getPlayers()
      },
      deep: true,
    },

    $type(v) {
      this.getPlayers();
    }
  },

  methods: {
    async getPlayers(this: any) {
      this.isLoadingGrid = true;

      const { page, itemsPerPage } = this.options;
      
      const response = await ranking.getTopRank({ page, limit: itemsPerPage, type: ranking.$type });

      if (response.status === 200) {
        this.$set(this, 'playersData', response.data);
        this.total = response.total;
        this.isLoadingGrid = false;
      }

      else {
        this.$set(this, 'playersData', []);
        this.isLoadingGrid = false;
      }
    },

    getVocation(vocation_id: number): String {
      return getVocationName(vocation_id) !== "Default" ? getVocationName(vocation_id) : "";
    }
  }
})
</script>