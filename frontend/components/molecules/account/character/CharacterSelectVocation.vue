<template>
  <div>
    <v-card
      flat
      tile
    >
      <v-window
        v-model="onboarding"
        reverse
      >
        <v-window-item
          v-for="(item, idx) in getVocationList"
          :key="`card-${idx}`"
        >
          <v-card
            height="550"
          >
            <v-row
              class="fill-height"
              align="center"
              justify="center"
            >
              <v-col cols="12" class="header-text text-center">
                <h1> {{ item.text }} </h1>
              </v-col>
              <v-col cols="12" class="text-center">
                <CharacterSelect :vocation_name="getSex + item.text"/>
              </v-col>
            </v-row>
          </v-card>
        </v-window-item>
      </v-window>

      <v-card-actions class="justify-space-between">
        <v-btn
          text
          @click="prev"
        >
          <v-icon>mdi-chevron-left</v-icon>
        </v-btn>
        <v-item-group
          v-model="onboarding"
          class="text-center"
          mandatory
        >
          <v-item
            v-for="(item, idx) in getVocationList"
            :key="`btn-${idx}`"
            v-slot="{ active, toggle }"
          >
            <v-btn
              :input-value="active"
              icon
              @click="toggle"
            >
              <v-icon>mdi-record</v-icon>
            </v-btn>
          </v-item>
        </v-item-group>
        <v-btn
          text
          @click="next"
        >
          <v-icon>mdi-chevron-right</v-icon>
        </v-btn>
      </v-card-actions>
    </v-card>
  </div>
</template>

<script lang="ts">
import Vue from 'vue'
import { createCharacter } from '@/store'
import { vocations } from '@/utils/enum'
import { CreateCharacter } from '@/models'

export default Vue.extend({
  data() {
    return {
      model: 0,
      last_value: 0,
      isLoading: 0,
      length: 3,
      onboarding: 0,
    }
  },
  
  computed: {
    $character(): CreateCharacter {
      return createCharacter.$character;
    },
    getVocationList(): { value: number, text: string}[] {
      return vocations.map((vocation) => ({
        value: vocation.initial_id,
        text: vocation.text
      }))
    },

    getSex(): String {
      return this.$character && this.$character.sex === 1 ? 'Female_' : 'Male_';
    }
  },

  methods: {
    next () {
      this.onboarding = this.onboarding + 1 === this.getVocationList.length
        ? 0
        : this.onboarding + 1
    },
    prev () {
      this.onboarding = this.onboarding - 1 < 0
        ? this.getVocationList.length - 1
        : this.onboarding - 1
    },
  }
})
</script>