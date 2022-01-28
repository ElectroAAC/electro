<template>
  <v-menu
    open-on-hover
    transition="scale-transition"
    bottom
    right
    offset-y
  >
    <template #activator="{ on, attrs }">
      <span 
        class="header-text"
        v-bind="attrs"
        v-on="on"
      >
        COMMUNITY
      </span>
    </template>
      
    <v-list class="header-list">
      <v-list-item
        v-for="(item, idx) in getRoutesCommunity"
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
import { routesCommunity } from '@/utils/enum'

export default Vue.extend({
  computed: {
    getRoutesCommunity(): Route[] {
      return routesCommunity;
    }
  }
})
</script>

<style lang="scss" scoped>
.v-btn.v-size--default {
  font-size: 16px !important;
}
</style>