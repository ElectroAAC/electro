<template>
  <v-container class="mt-4 mb-2">
    <v-row v-for="(item, idx) in data" :key="idx">
      <v-col cols="4" class="bg-second mb-2"> {{ item.text }}: </v-col>

      <v-col cols="7" class="bg-second ml-4 mb-2"> 
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
          text: 'Account Status'
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