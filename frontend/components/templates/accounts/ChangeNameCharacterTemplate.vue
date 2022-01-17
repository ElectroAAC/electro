<template>
  <div>
    <ChangeName v-if="$statusChangeName"/>

    <v-container v-else class="mt-15">
      Change character name is disabled
    </v-container>
  </div>
</template>

<script lang="ts">
import Vue from 'vue'
import { account } from '@/store'

export default Vue.extend({
  computed: {
    $statusChangeName() {
      return account.$changeName.enabled;
    }
  },

  mounted(){ 
    account.getChangeNameStatus();
  },
})
</script>