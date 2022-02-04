<template>
  <div class="container">
    <v-bottom-navigation v-model="value">
      <v-btn value="Experience">
        <span class="btn-highscores">Experience</span>
        <v-icon>mdi-karate</v-icon>
      </v-btn>

      <v-btn value="Magic Level">
        <span>Magic Level</span>
        <v-icon>mdi-creation</v-icon>
      </v-btn>

      <v-btn value="Attack Speed">
        <span>Attack Speed</span>
        <v-icon>mdi-run-fast</v-icon>
      </v-btn>

      <v-btn value="Club">
        <span>Glove</span>
        <v-icon>mdi-arm-flex</v-icon>
      </v-btn>

      <v-btn value="Sword">
        <span>Sword</span>
        <v-icon>mdi-sword</v-icon>
      </v-btn>

      <v-btn value="Bow">
        <span>Distance</span>
        <v-icon>mdi-bow-arrow</v-icon>
      </v-btn>

      <v-btn value="Axe">
        <span>Axe</span>
        <v-icon>mdi-axe-battle</v-icon>
      </v-btn>

      <v-btn value="Shielding">
        <span>Shield</span>
        <v-icon>mdi-shield-sun-outline</v-icon>
      </v-btn>
    </v-bottom-navigation>

    <HighscoresTable
      :search="search"
      class="mt-2"
    />
  </div>
</template>

<script lang="ts">
import Vue from 'vue'
import { ranking } from '@/store'

export default Vue.extend({
  data() {
    return {
      value: 'Experience',
      search: ''
    }
  },

  computed: {
    $type() {
      return ranking.$type
    }
  },

  watch: {
    value(v) {
      ranking.setType(v);
    }
  },

  methods: {
    updateSearch(value: string): void {
      this.$set(this, "search", value);
    },
  }
})
</script>