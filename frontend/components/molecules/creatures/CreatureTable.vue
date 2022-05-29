<template>
  <v-data-table
    :headers="getHeaders"
    :items="getCreaturesData"
    mobile-breakpoint="0"
    no-data-text="No creature found"
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
        <v-col v-for="(loot, idx) in JSON.parse(item.loot)" :key="idx" cols="auto">
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

          <span>
            Item <br>
            Chance: {{ loot.chance / 1000 }}% <br>
            Count Max: {{ loot.countmax }}
          </span>
        </v-tooltip>
      </v-col>
      </v-row>
    </template>
  </v-data-table>
</template>

<script lang="ts">
import Vue from 'vue'

export default Vue.extend({
  props: {
    data: {
      type: Array,
      default: () => []
    }
  },

  data() {
    return {
      footerProps: {
        "items-per-page-options": [25, 50, 100, 150],
        "items-per-page-text": "Creatures per page",
      },
    }
  },

  computed: {
    getCreaturesData(this: any): any[] {
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
  },

  methods: {
    getLoot(item: any) {
      if (item.length) {
        const items = JSON.parse(item);
        let loot = "";
        items.map((item) => {

        })
      }
      return "";
    }
  }
})
</script>