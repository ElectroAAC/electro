<template>
  <v-row class="bg-second ma-2 text-center" v-if="getCharacter">
    
    <v-col cols="12">
      {{ getCharacter.name }}
    </v-col>

    <div v-if="loading" class="text-center">
      <Loading  style="width: 50% !important;" />
    </div>

    <v-col v-if="!loading" cols="6">
      <h3> Skills </h3>

      <v-col 
        v-for="(skill, idx) in $characterSkills"
        class="d-flex align-content-start flex-wrap pa-0"
        cols="12"
        :key="idx"
      >
        <v-col cols="6">  {{ getSkillName(skill.skillid) }} </v-col>
        <v-col cols="6"> {{ skill.value}} </v-col>
      </v-col>
    </v-col>

    <v-col v-if="!loading" cols="6" class="d-flex align-content-start flex-wrap pa-0 text-center">
      <v-col cols="12"> <h3> Equipments </h3> </v-col>
      
      <v-col cols="6" class="d-flex align-content-center flex-wrap pa-0 text-center" style="width: 200px !important;">
        <v-col 
          v-for="(item, idx) in $characterItems" 
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
      </v-col>
    </v-col>
  </v-row>
</template>

<script lang="ts">
import Vue from 'vue'
import { characterItems, items, skill } from '@/store'
import { skillName } from '@/utils/enum'
import { CharacterItem, CharactersAccount, Items } from '@/models'

export default Vue.extend({
  props: {
    character: {
      type: Object,
      default: () => {}
    },
    loading: {
      type: Boolean,
      default: false
    }
  },
  
  computed: {
    getItemList(): Items[] {
      return items.$items;
    },

    getCharacter(): CharactersAccount {
      return this.character;
    },

    $characterSkills() {
      return skill.$skills;
    },

    $characterItems(): CharacterItem[] {
      return characterItems.$items;
    }
  },

  methods: {
    getItem(this: any, id: Number) {
      return this.getItemList.some((item: Items) => item.itemId === id);
    },

    getItemName(this: any, id: Number, slot: String) {
      return this.getItemList.some((item: Items) => item.itemId === id)
        ? this.getItemList.find((item: Items) => item.itemId === id).name
        : "No_" + slot;
    },

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

    getSkillName(this: any, id: Number): String | undefined {
      const skill = skillName.find((skill: { value: number }) => skill.value === id);
      return skill?.text;
    }
  }
})
</script>