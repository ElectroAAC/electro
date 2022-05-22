<template>
  <v-menu
    open-on-hover
    transition="scale-transition"
    bottom
    offset-y
  >
    <template #activator="{ on, attrs }">
      <span 
        class="header-text cursor-pointer"
        v-bind="attrs"
        v-on="on"
      >
        SHOP +
      </span>
    </template>
      
    <v-list class="mt-3 header-list">
      <v-list-item
        v-for="(item, idx) in getRoutesShop"
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
import { routesShop } from '@/utils/routes'

export default Vue.extend({
  computed: {
    getRoutesShop(): Route[] {
      return routesShop;
    }
  }
})
</script>

<style lang="scss" scoped>
.v-btn.v-size--default {
  font-size: 16px !important;
}
</style>