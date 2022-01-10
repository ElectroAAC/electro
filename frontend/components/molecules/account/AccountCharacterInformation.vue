<template>
  <div class="bg-second ma-2 text-center">
    {{ character.name }}
  </div>
</template>

<script lang="ts">
import Vue from 'vue'

export default Vue.extend({
  props: {
    character: {
      type: Object,
      default: () => {}
    }
  }
})
</script>