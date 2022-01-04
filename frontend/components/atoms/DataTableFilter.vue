<template>
  <div class="d-flex justify-space-between mb-6}">
    <v-text-field
      :value="$_search"
      append-icon="mdi-magnify"
      label="Procurar"
      hide-details
      class="mt-4 ml-4"
      @input="($event) => 
        {
          updateSearch($event);
        }
      "
    ></v-text-field>
  </div>
</template>

<script lang="ts">
import Vue from 'vue'
export default Vue.extend({
  data() {
    return {
      attrs: null,
      on: null,
    }
  },

  props: {
    search: {
      type: String,
      required: true
    }
  },

  computed: {
    $_search(): string {
      return this.search;
    }
  },

  methods: {
    updateSearch(value: string): void {
      this.$emit('update-search', value);
    }
  }
})
</script>