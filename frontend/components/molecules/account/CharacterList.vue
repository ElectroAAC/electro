<template>
  <div>
    <v-sheet
      class="mx-auto bg-character-list"
    >
      <v-slide-group
        v-model="model"
        class="pa-4"
        active-class="green"
        show-arrows
        @click:next="nextSlide()"
        @click:prev="previousSlide()"
      >
        <v-slide-item
          v-for="(item, idx) in items"
          :key="idx"
          v-slot="{ toggle }"
        >
          <v-card
            class="ma-4"
            height="150"
            width="150"
            @click="toggle"
          >
            <v-row
              class="fill-height"
              align="center"
              justify="center"
            >
              <v-scale-transition>
                <CharacterAvatar 
                  :avatar="item.vocation" 
                  class="mt-2" 
                  width="150px"
                  height="155px"
                />
              </v-scale-transition>
            </v-row>
          </v-card>
        </v-slide-item>
      </v-slide-group>

      <v-expand-transition>
        <v-sheet
          v-if="model != null"
          class="bg-character-list"
          height="200"
          tile
        >
          <AccountCharacterInformation :character="items[model]" />
        </v-sheet>
      </v-expand-transition>
    </v-sheet>
  </div>
</template>

<script lang="ts">
import Vue from 'vue'
export default Vue.extend({
  data() {
    return {
      model: 0,
      items: [
        {
          id: 1,
          name: 'Orc Sample',
          level: '15',
          vocation: 'Orc'
        },
        {
          id: 2,
          name: 'Witch Sample',
          level: '66',
          vocation: 'Witch'
        },
        {
          id: 3,
          name: 'Lizard Sample',
          level: '31',
          vocation: 'Lizard'
        },
        {
          id: 4,
          name: 'Demon Sample',
          level: '37',
          vocation: 'Demon'
        },
        {
          id: 5,
          name: 'Warrior Sample',
          level: '81',
          vocation: 'Warrior'
        },
        {
          id: 6,
          name: 'Ancian Sample',
          level: '16',
          vocation: 'Ancian'
        },
        {
          id: 7,
          name: 'Spider Sample',
          level: '28',
          vocation: 'Spider'
        },
      ],
    }
  },
  
  methods: {
    nextSlide() {
      this.model + 1 === this.items.length ? this.model = 0 : this.model++;
    },

    previousSlide() {
      this.model === 0 ? this.model = this.items.length : this.model--;
    },
  }
})
</script>