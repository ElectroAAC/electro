<template>
  <v-container class="mt-4 mb-2">
    <v-row v-for="(item, idx) in data" :key="idx" class="text-center">
      <v-col cols="3" class="mr-1 pa-1 bg-second mb-2"> {{ item.text }}: </v-col>

      <v-col cols="8" class="pa-1 bg-second mb-2"> 
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
          value: 'created',
          text: 'Created'
        },
        {
          value: 'web_lastlogin',
          text: 'Last Login'
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