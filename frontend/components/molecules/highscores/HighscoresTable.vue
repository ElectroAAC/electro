<template>
  <div>
    <v-data-table
      :headers="getHeaders"
      :items="playersData"
      :options.sync="options"
      :server-items-length="total"
      :items-per-page="itemsPerPage"
      :loading="isLoadingGrid"
      :page.sync="page"
      hide-default-footer
      mobile-breakpoint="0"
      loading-text="Loading Player List..."
      no-data-text="No player found"
      @page-count="pageCount = $event"
    >
      <!-- eslint-disable-next-line vue/valid-v-slot -->
      <template #item.position="{ index }">
        {{ index+1 }}
      </template>
      
      <!-- eslint-disable-next-line vue/valid-v-slot -->
      <template #item.name="{ item }">
        <NuxtLink :to="`/character/${item.name}`" :class="`color-${item.online === 1 ? 'green' : 'red'}`"> {{ item.name }} </NuxtLink> <br>
        {{ getVocation(item.vocation) }}
      </template>
    </v-data-table>
    
    <v-pagination
      v-model="page"
      circle
      :length="pageCount"
    ></v-pagination>
  </div>
</template>

<script lang="ts">
import Vue from 'vue'
import { ranking } from '@/store'
import { getVocationName } from '@/utils/methods'

export default Vue.extend({
  data() {
    return {
      page: 1,
      pageCount: 0,
      itemsPerPage: 25,
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