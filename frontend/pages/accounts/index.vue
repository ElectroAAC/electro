<template>
  <div>
    <AccountTemplate class="mb-5"/>
  </div>
</template>

<script lang="ts">
import Vue from 'vue'
export default Vue.extend({
  middleware: 'auth',
})
</script>