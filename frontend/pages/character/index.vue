<template>
  <div>
    <CharacterTemplate :character_name="getCharacterName" />
  </div>
</template>

<script lang="ts">
import Vue from 'vue'
export default Vue.extend({
  computed: {
    getCharacterName(): string | void {
      if (this.$route.params && this.$route.params.name)
        return this.$route.params.name;
    }
  }
})
</script>