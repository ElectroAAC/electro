<template>
  <v-container class="dashboard-container">
    <v-row class="pa-0">
      <v-col cols="4" class="text-center">
        <v-icon size="96">
          mdi-account
        </v-icon>
      </v-col>

      <v-col cols="8" class="d-flex justify-center align-center flex-wrap text-center">
        <v-col cols="12"> <h2> Total Accounts </h2> </v-col>
        <h3> {{ getTotalAccounts }} </h3>
      </v-col>
    </v-row>
  </v-container>
</template>

<script lang="ts">
import Vue from 'vue'
export default Vue.extend({
  props: {
    total_accounts: {
      type: Number,
      default: 0
    }
  },

  computed: {
    getTotalAccounts(): Number {
      return this.total_accounts;
    }
  }
})
</script>