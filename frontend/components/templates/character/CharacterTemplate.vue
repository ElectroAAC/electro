<template>
  <v-container>
    <CharacterSearchForm v-if="!getCharacterName" />
    <div v-else> 
      {{ getCharacterName }}
    </div>
  </v-container>
</template>

<script lang="ts">
import Vue from 'vue'
export default Vue.extend({
  props: {
    character_name: {
      type: String,
      default: ""
    }
  },

  computed: {
    getCharacterName(): String {
      return this.character_name;
    }
  }
})
</script>