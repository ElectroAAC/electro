<template>
  <v-menu
    open-on-hover
    bottom
    offset-y
  >
    <template #activator="{ on, attrs }">
      <v-btn
        text
        class="header-text"
        v-bind="attrs"
        v-on="on"
      >
        <v-icon>mdi-account</v-icon> 
        <NuxtLink v-if="!$vuetify.breakpoint.mdAndDown" to="/accounts"> {{ $account.name }} </NuxtLink>
        <span v-else> {{ $account.name }} </span>
      </v-btn>
    </template>
      
    <v-list class="header-list">
      <v-list-item v-if="$account.name && $account.group_id === 6">
        <v-list-item-title class="header-text">
          <NuxtLink to="/dashboard"> Dashboard </NuxtLink>
        </v-list-item-title>
      </v-list-item>
        
      <v-list-item v-if="!$account.name">
        <v-list-item-title class="header-text">
          <span style="cursor: pointer;" @click="updateDialog()"> Login </span>
        </v-list-item-title>
      </v-list-item>

      <v-list-item
        v-for="(item, idx) in getRoutesAccount"
        v-else
        :key="idx"
      >
        <v-list-item-title class="header-text">
          <NuxtLink :to="item.to"> {{ item.text }} </NuxtLink>
        </v-list-item-title>
      </v-list-item>

      <v-list-item v-if="$account.name">
        <v-list-item-title class="header-text">
          <span style="cursor: pointer;" @click="onLogout()"> Logout </span>
        </v-list-item-title>
      </v-list-item>
    </v-list>
  </v-menu>
</template>

<script lang="ts">
import Vue from 'vue'
import { auth, account } from '@/store'
import { Accounts, Route } from '@/models'
import { routesAccount } from '@/utils/routes'

export default Vue.extend({
  computed: {
    $account(): Accounts {
      return account.$account;
    },
    getRoutesAccount(): Route[] {
      return routesAccount;
    }
  },
  
  methods: {
    updateDialog() {
      this.$emit('update-dialog', true);
    },

    onLogout(this: any): void {
      auth.destroy();
      if (this.$route && this.$route.fullPath !== "/") {
        this.$router.push("/")
      }
    }
  }
})
</script>