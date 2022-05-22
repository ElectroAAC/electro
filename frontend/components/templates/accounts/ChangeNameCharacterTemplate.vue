<template>
  <div>
    <Title text="Change Name"/>

    <ChangeName v-if="$statusChangeName" class="main-content"/>

    <v-container v-else class="main-content">
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