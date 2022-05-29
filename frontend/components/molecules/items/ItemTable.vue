<template>
  <div>
    <v-col class="text-center" cols="12">
      <v-row class="text-center">
        <v-col v-for="(item, idx) in items" :key="idx" cols="auto">
          <v-btn class="btn-item" text @click="getItems(item)">
            <img :src="require(`~/assets/images/items/${item}.gif`)"> <br>
            <span class="bold"> {{ item.charAt(0).toUpperCase() + item.slice(1) }} </span>
          </v-btn>
        </v-col>
      </v-row>

      <v-data-table
        :headers="getHeaders"
        :items="$items"
        mobile-breakpoint="0"
        no-data-text="No item found"
        class="mt-10"
        hide-default-footer
        disable-pagination
        fixed-header
      >
      </v-data-table>
    </v-col>
  </div>
</template>

<script lang="ts">
import Vue from 'vue'
import { items } from '@/store'

export default Vue.extend({
  data() {
    return {
      items: [ 'head', 'body', 'legs', 'feet', 'sword', 'club', 'distance', 'shield', 'necklace', 'ring', 'backpack'],
      itemSelected: 'head'
    }
  },

  computed: {
    $items(): Object[] {
      return items.$items;
    },

    getHeaders() {
      if (this.itemSelected === "sword" || this.itemSelected === "club" || this.itemSelected === "distance" || this.itemSelected === "shield") {
        return [
          { text: 'Image', value: 'image', align: 'center', width: '100' },
          { text: 'Name', value: 'name', align: 'center' },
          { text: 'Description', value: 'description', align: 'center' },
          { text: 'Armor', value: 'armor', align: 'center', width: '100' },
          { text: 'Attack', value: 'attack', align: 'center', width: '100' },
          { text: 'Defense', value: 'defense', align: 'center', width: '100' },
        ]
      } 
      
      else {
        return [
          { text: 'Image', value: 'image', align: 'center', width: '100' },
          { text: 'Name', value: 'name', align: 'center' },
          { text: 'Description', value: 'description', align: 'center' },
          { text: 'Armor', value: 'armor', align: 'center', width: '100' },
        ]
      }
    }
  },

  methods: {
    async getItems(type: string): Promise<void> {
      this.$set(this, 'itemSelected', type);
      await items.getItems(type);
    }
  }
})
</script>