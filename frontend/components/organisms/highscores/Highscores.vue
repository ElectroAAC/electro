<template>
  <div class="container">
    <v-bottom-navigation v-model="value" v-if="!$vuetify.breakpoint.mdAndDown">
      <v-btn v-for="(item, idx) in options" :key="idx" :value="item.value">
        <span>{{ item.text }}</span>
        <v-icon>{{ item.icon }}</v-icon>
      </v-btn>
    </v-bottom-navigation>

    <v-select 
      v-else
      :value="value"
      :items="options"
      :menu-props="{ bottom: true, offsetY: true }"
      return-object
      outlined
      dense
      hide-details
      @change="($event) => {
        value = $event.text;
      }"
    />

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
      search: '',
      options: [
        {
          value: "Experience",
          icon: "mdi-karate",
          text: "Experience"
        },
        {
          value: "Magic Level",
          icon: "mdi-creation",
          text: "Magic Level"
        },
        {
          value: "Attack Speed",
          icon: "mdi-run-fast",
          text: "Attack Speed"
        },
        {
          value: "Club",
          icon: "mdi-arm-flex",
          text: "Club"
        },
        {
          value: "Sword",
          icon: "mdi-sword",
          text: "Sword"
        },
        {
          value: "Distance",
          icon: "mdi-bow-arrow",
          text: "Distance"
        },
        {
          value: "Axe",
          icon: "mdi-axe-battle",
          text: "Axe"
        },
        {
          value: "Shielding",
          icon: "mdi-shield-sun-outline",
          text: "Shielding"
        },
        {
          value: "Frags",
          icon: "mdi-skull-outline",
          text: "Frags"
        },
      ]
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