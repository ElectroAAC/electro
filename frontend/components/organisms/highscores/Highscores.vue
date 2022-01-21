<template>
  <div class="container">
    <v-row>
      <v-spacer></v-spacer>
      <v-col cols="2" class="text-right">
        <v-tooltip bottom>
          <template v-slot:activator="{ on, attrs }">
            <v-btn icon color="gray" class="mt-6">
              <v-icon v-bind="attrs" v-on="on"> mdi-filter </v-icon>
            </v-btn>
          </template>
          <span>Filtrar</span>
        </v-tooltip>
      </v-col>
    </v-row>

    <HighscoresTable
      :search="search"
      class="mt-2"
    />
  </div>
</template>

<script lang="ts">
import Vue from 'vue'
export default Vue.extend({
  data() {
    return {
      search: ''
    }
  },

  methods: {
    updateSearch(value: string): void {
      this.$set(this, "search", value);
    },
  }
})
</script>