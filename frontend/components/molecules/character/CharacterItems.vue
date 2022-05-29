<template>
  <div class="character-informations text-center" style="height: 100% !important;">
    <v-row class="text-center ma-0 pa-0">
      <v-col cols="12"> <h3> Equipments </h3> </v-col>
      
      <div class="d-flex align-content-center flex-wrap pa-0 text-center" style="width: 200px !important;">
        <v-col 
          v-for="(item, idx) in $items" 
          :class="getPaddingItemSlot(item.slot)"
          :key="idx"
          class="pa-0"
          cols="4"
        > 
          <v-tooltip top>
            <template v-slot:activator="{ on, attrs }">
              <div
                v-if="getItem(item.id)"
                v-bind="attrs"
                v-on="on"
              >
                <ItemImage 
                  :image="item.id"
                  image_name="Item"
                  style="border: 1px solid var(--second-color);"
                  v-bind="attrs"
                  v-on="on"
                />
              </div>

              <div 
                v-else
                v-bind="attrs"
                v-on="on"
              >
                <img 
                  :src="require(`~/assets/images/items/no_${item.slot}.png`)"
                  width="32"
                  height="32"
                  style="border: 1px solid var(--second-color);"
                />
              </div>
            </template>
            <span> {{ getItemName(item.id, item.slot) }} </span>
          </v-tooltip>
        </v-col>
      </div>
    </v-row>
  </div>
</template>

<script lang="ts">
import Vue from 'vue'
import { characterItems, items } from '@/store'
import { CharacterItem, Items } from '@/models'

export default Vue.extend({
  computed: {
    $items(): CharacterItem[] {
      return characterItems.$items;
    },

    getItemList(): Items[] {
      return items.$items;
    },
  },

  methods: {
    getPaddingItemSlot(slot: String): String {
      switch(slot) {
        case 'necklace':
          return 'pt-2';
        case 'backpack':
          return 'pt-2';
        case 'armor':
          return 'pb-2';
        case 'legs':
          return 'pb-2';
        case 'boots':
          return 'pt-0';
        default:
          return "";
      }
    },
    
    getItem(this: any, id: Number) {
      return this.getItemList.some((item: Items) => item.itemId === id);
    },

    getItemName(this: any, id: Number, slot: String) {
      return this.getItemList.some((item: Items) => item.itemId === id)
        ? this.getItemList.find((item: Items) => item.itemId === id).name
        : "No_" + slot;
    },
  }
})
</script>