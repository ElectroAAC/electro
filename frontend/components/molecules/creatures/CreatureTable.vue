<template>
  <v-data-table
    :headers="getHeaders"
    :items="creaturesData"
    :options.sync="options"
    :server-items-length="total"
    :items-per-page="itemsPerPage"
    :loading="isLoadingGrid"
    :page.sync="page"
    :footer-props="footerProps"
    mobile-breakpoint="0"
    loading-text="Loading Creature List..."
    no-data-text="No Creature found"
    @page-count="pageCount = $event"
  >    
    <!-- eslint-disable-next-line vue/valid-v-slot -->
    <template #item.outfit="{ item }">
      <AnimatedOutfit 
        :look_type="item.look_type"
        :look_addons="0"
        :look_head="0"
        :look_body="0"
        :look_legs="0"
        :look_feet="0"
      />
    </template>

    <!-- eslint-disable-next-line vue/valid-v-slot -->
    <template #item.name="{ item }">
      {{ item.name }}
    </template>

    <!-- eslint-disable-next-line vue/valid-v-slot -->
    <template #item.loot="{ item }">
      <v-row class="pa-0">
        <v-col v-for="(loot, idx) in getLoot(item.loot)" :key="idx" cols="auto">
        <v-tooltip v-if="loot" top>
          <template v-slot:activator="{ on, attrs }">
            <div
              v-bind="attrs"
              v-on="on"
            >
              <ItemImage 
                :image="parseInt(loot.id) || 0"
                image_name="Item"
              />
            </div>
          </template>

          <div>
            <span class="bold color-orange"> {{ getItemName(loot.id) }} </span><br>
            Chance: <span class="bold color-orange"> {{ parseInt(loot.chance) / 1000 }}% </span> <br>
            Count Max: <span class="bold color-orange"> {{ loot.countmax }} </span>
          </div>
        </v-tooltip>
      </v-col>
      </v-row>
    </template>
  </v-data-table>
</template>

<script lang="ts">
import Vue from 'vue'
import { creatures, items } from '@/store'

export default Vue.extend({
  props: {
    data: {
      type: Array,
      default: () => []
    }
  },

  data() {
    return {
      page: 1,
      pageCount: 0,
      itemsPerPage: 25,
      isLoadingGrid: true,
      creaturesData: [],
      options: {},
      total: 0,
      footerProps: {
        "items-per-page-options": [25, 50, 100, 150],
        "items-per-page-text": "Creatures per page",
      },
    }
  },

  computed: {
    getCreaturesData(this: any): any {
      return this.data;
    },
    
    getHeaders(): Object[] {
      return [
        { text: 'Outfit', value: 'outfit', align: 'center', sortable: false },
        { text: 'Name', value: 'name', align: 'center' },
        { text: 'Experience', value: 'experience', align: 'center' },
        { text: 'Health', value: 'health', align: 'center'},
        { text: 'Loot', value: 'loot', align: 'center'},
      ];
    },

    getItemList() {
      return items.$items;
    }
  },

  async mounted() {
    const promise = [
      this.getCreatures(),
      items.getItems('all')
    ];

    await Promise.all(promise);
  },

  watch: {
    options: {
      handler () {
        this.getCreatures()
      },
      deep: true,
    }
  },

  methods: {
    async getCreatures(this: any) {
      this.isLoadingGrid = true;

      const { page, itemsPerPage } = this.options;
      
      const response = await creatures.getCreatures({ page, limit: itemsPerPage });


      if (response.status === 200) {
        this.$set(this, 'creaturesData', response.data);
        this.total = response.total;
        this.isLoadingGrid = false;
      }

      else {
        this.$set(this, 'creaturesData', []);
        this.isLoadingGrid = false;
      }
    },

    getLoot(loot: any): {
      id: string,
      countmax: string,
      chance: string
    }[] {
      return JSON.parse(loot);
    },

    getItemName(itemId: string) {
      const item = this.getItemList.find((item) => item.itemId === parseInt(itemId));

      if (item)
        return item.name;
      
      return "";
    }
  }
})
</script>