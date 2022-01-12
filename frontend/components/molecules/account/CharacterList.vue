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
        @change="changeLastValue($event)"
        @click:next="nextSlide()"
        @click:prev="previousSlide()"
      >
        <v-slide-item
          v-for="(item, idx) in getCharacters"
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
          tile
        >
          <AccountCharacterInformation :character="getCharacters[model]" />
        </v-sheet>
      </v-expand-transition>
    </v-sheet>
  </div>
</template>

<script lang="ts">
import Vue from 'vue'
import { players } from '@/utils/fakeData'
export default Vue.extend({
  data() {
    return {
      model: 0,
      last_value: 0
    }
  },

  computed: {
    getCharacters(): Object[] {
      return players;
    }
  },
  
  methods: {
    nextSlide() {
      if (isNaN(this.model)) {
        this.model = this.last_value;
        return;
      }

      if (this.model + 1 === this.getCharacters.length) {
        this.$set(this, 'model', 0);
        this.$set(this, 'last_value', this.model);
      }

      else {
        this.$set(this, 'model', this.model+1);
        this.$set(this, 'last_value', this.model);
      }
    },

    previousSlide() {
      if (isNaN(this.model)) {
        this.model = this.last_value;
        return;
      }

      if (this.model === 0) {
        this.$set(this, 'model', this.getCharacters.length);
        this.$set(this, 'last_value', this.model);
      }
      else {
        this.$set(this, 'model', this.model+1);
        this.$set(this, 'last_value', this.model);
      }
    },

    changeLastValue(event: any): void {
      if (!isNaN(event)) {
        this.$set(this, 'last_value', this.model);
      }
    }
  }
})
</script>