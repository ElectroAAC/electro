<template>
  <v-container class="mt-4 mb-2">
    <v-row v-for="(item, idx) in data" :key="idx">
      <v-col cols="12" class="color-gray mr-1 pa-1"> {{ item.text }}: </v-col>

      <v-col cols="12" class="pa-1 mb-2"> 
        {{ 
          item.value === 'premdays'
            ? $account[item.value] > 0 ? 'VIP' : 'Free Account'
            : item.value === 'key'
              ? $account[item.value] === "" ? 'No' : 'Yes'
              : $account[item.value] 
        }} 
      </v-col>
    </v-row>
  </v-container>
</template>

<script lang="ts">
import Vue from 'vue'
import { account } from '@/store'

export default Vue.extend({
  data() {
    return {
      data: [
        {
          value: 'name',
          text: 'Name'
        },
        {
          value: 'email',
          text: 'Email'
        },
        {
          value: 'premdays',
          text: 'Status'
        },
        {
          value: 'key',
          text: 'Registered'
        },
      ]
    }
  },

  computed: {
    $account() {
      return account.$account;
    }
  }
})
</script>