<template>
  <div>
    <ChangeNameCharacterTemplate />
  </div>
</template>

<script lang="ts">
import Vue from 'vue'
import { account } from '@/store'

export default Vue.extend({
  middleware: 'auth',
  
  async mounted() {
    await account.getChangeNameStatus();
  }
})
</script>