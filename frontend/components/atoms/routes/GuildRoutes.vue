<template>
  <v-menu
    open-on-hover
    transition="scale-transition"
    bottom
    offset-y
  >
    <template #activator="{ on, attrs }">
      <span v-bind="attrs" v-on="on">
        GUILDS +
      </span>
    </template>
      
    <v-list class="mt-3 header-list">
      <v-list-item
        v-for="(item, idx) in getRoutesGuild"
        :key="idx"
      >
        <v-list-item-title class="header-text">
          <NuxtLink :to="item.to"> {{ item.text }} </NuxtLink>
        </v-list-item-title>
      </v-list-item>
    </v-list>
  </v-menu>
</template>

<script lang="ts">
import Vue from 'vue'
import { Route } from '@/models'
import { routesGuild } from '@/utils/routes'

export default Vue.extend({
  computed: {
    getRoutesGuild(): Route[] {
      return routesGuild;
    }
  }
})
</script>

<style lang="scss" scoped>
.v-btn.v-size--default {
  font-size: 16px !important;
}
</style>