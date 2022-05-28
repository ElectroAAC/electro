<template>
  <v-row class="bg-second ma-2 text-center" v-if="getCharacter">
    <v-col cols="12">
      {{ getCharacter.name }}
    </v-col>

    <v-col cols="6">
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

    <v-col cols="6" class="d-flex align-content-start flex-wrap pa-0 text-center">
      <v-col cols="12"> <h3> Equipments </h3> </v-col>
      
      <v-col cols="6" class="d-flex align-content-center flex-wrap pa-0 text-center">
        <v-col 
          v-for="(item, idx) in $characterItems" 
          :class="getPaddingItemSlot(item.slot)"
          :key="idx"
          cols="4"
        > 
          <v-tooltip top>
            <template v-slot:activator="{ on, attrs }">
              <img 
                :src="require(`~/assets/images/items/${getItem(item.id, item.slot)}.gif`)"
                width="32"
                height="32"
                v-bind="attrs"
                v-on="on"
              />
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
import { character, items, skill } from '@/store'
import { items as ItemList } from '@/utils/fakeData'
import { skillName } from '@/utils/enum'
import { Item, CharactersAccount } from '@/models'

export default Vue.extend({
  props: {
    character: {
      type: Object,
      default: () => {}
    }
  },
  
  computed: {
    getItemList(): Object[] {
      return ItemList;
    },
    getCharacter(): CharactersAccount {
      return this.character;
    },
    $characterSkills() {
      return skill.$skills;
    },
    $characterItems() {
      return items.$items;
    }
  },

  methods: {
    getItem(this: any, id: Number, slot: String) {
      return this.getItemList.some((item: Item) => item.id === id)
        ? this.getItemList.find((item: Item) => item.id === id).id
        : slot;
    },

    getItemName(this: any, id: Number, slot: String) {
      return this.getItemList.some((item: Item) => item.id === id)
        ? this.getItemList.find((item: Item) => item.id === id).name
        : "No_" + slot;
    },

    getPaddingItemSlot(slot: String): String {
      switch(slot) {
        case 'necklace':
          return 'pt-6';
        case 'backpack':
          return 'pt-6';
        case 'armor':
          return 'pt-0';
        case 'legs':
          return 'pt-0';
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