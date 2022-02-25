<template>
  <div>
    <v-sheet
      class="mx-auto bg-character-list"
    >
      <v-slide-group
        v-model="model"
        class="pa-4"
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
            height="200"
            width="200"
            @click="toggle"
          >
            <v-row
              class="fill-height"
              align="center"
              justify="center"
            >
              <v-scale-transition>
                <AccountCharacterAvatar 
                  :avatar="getVocation(item.vocation)" 
                  :text="item.name"
                  :level="item.level"
                  class="mt-3" 
                  width_image="160px"
                  height="165px"
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
          <div v-if="isLoading" class="text-center">
            <Loading  style="width: 50% !important;" />
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
import { getVocationName } from '@/utils/methods'

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

  created() {
    if (account.$account.id) {
      account.getCharacters(account.$account.id);
    }
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

    getVocation(vocation_id: Number | number): String | undefined {
      return getVocationName(vocation_id);
    }
  }
})
</script>