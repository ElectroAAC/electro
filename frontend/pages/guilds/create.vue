<template>
  <CreateGuildTemplate class="mb-5"/>
</template>

<script lang="ts">
import Vue from 'vue'
export default Vue.extend({
  middleware: 'auth',
})
</script>