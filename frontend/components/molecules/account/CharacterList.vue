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
            class="ma-6"
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
                  :avatar="getVocationName(item.vocation)" 
                  class="mt-2" 
                  width="150px"
                  height="155px"
                />
              </v-scale-transition>
              {{ item.name }}
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
          <div v-if="isLoading" class="text-center">
            <v-progress-circular
              indeterminate
              color="primary"
            ></v-progress-circular>
          </div>

          <AccountCharacterInformation 
            v-else 
            :character="getCharacters[model]" 
          />
        </v-sheet>
      </v-expand-transition>
    </v-sheet>
  </div>
</template>

<script lang="ts">
import Vue from 'vue'
import { account, character } from '@/store'
import { CharactersAccount } from '@/models'
import { vocations } from '@/utils/enum'

export default Vue.extend({
  data() {
    return {
      model: 0,
      last_value: 0,
      isLoading: 0
    }
  },

  computed: {
    getCharacters(): CharactersAccount[] {
      return account.$characters;
    },
  },

  watch: {
    async model(v): Promise<void> {
      if (v) {
        const character_id = this.getCharacters[v].id;
        if (character_id) {
          try {
            this.$set(this, 'isLoading', true);

            const promises = [
              character.getSkill(character_id),
              character.getItems(character_id)
            ];

            await Promise.all(promises);
          } catch (err) {
            console.log('Error: ', err);
          } finally {
            this.$set(this, 'isLoading', false);
          }
        }
      }
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
        this.$set(this, 'model', this.getCharacters.length-1);
        this.$set(this, 'last_value', this.model);
      }
      else {
        this.$set(this, 'model', this.model-1);
        this.$set(this, 'last_value', this.model);
      }
    },

    changeLastValue(event: any): void {
      if (!isNaN(event)) {
        this.$set(this, 'last_value', this.model);
      }
    },

    getVocationName(vocation_id: Number | number): String | undefined {
      const vocation = vocations.find((vocation) => vocation.value === vocation_id)?.text;
      if (vocation)
        return vocation;
      return "Default";
    }
  }
})
</script>