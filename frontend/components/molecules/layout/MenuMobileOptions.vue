<template>
  <v-list :class="miniVariant ? '' : 'ml-4 mr-4'">
    <v-list-item router exact>
      <v-list-item-content>
        <v-list-item>
          <v-list-item-title class="dashboard-menu-text"> <NuxtLink to="/" class="pa-5"> HOME </NuxtLink> </v-list-item-title>
        </v-list-item>

        <v-list-item>
          <v-treeview
            v-model="tree"
            :items="getRoutesCommunity"
            open-on-click
            expand-icon="mdi-chevron-down"
            item-key="text"
          > 
            <template v-slot:append="{ item }">
              <NuxtLink v-if="item.to" class="dashboard-menu-text" :to="item.to"> {{ item.text }} </NuxtLink>
              <span v-else class="dashboard-menu-text"> {{ item.text }} </span>
            </template>
          </v-treeview>
        </v-list-item>

        <v-list-item>
          <v-list-item-title class="dashboard-menu-text"> <NuxtLink to="/highscores" class="pa-5"> HIGHSCORES </NuxtLink> </v-list-item-title>
        </v-list-item>

        <v-list-item>
          <v-list-item-title class="dashboard-menu-text"> <NuxtLink to="/guilds" class="pa-5"> GUILDS </NuxtLink> </v-list-item-title>
        </v-list-item>

        <v-list-item>
          <v-list-item-title class="dashboard-menu-text"> <NuxtLink to="/" class="pa-5"> SHOP </NuxtLink> </v-list-item-title>
        </v-list-item>

        <v-list-item>
          <v-list-item-title class="dashboard-menu-text"> <NuxtLink to="/downloads" class="pa-5"> DOWNLOAD </NuxtLink> </v-list-item-title>
        </v-list-item>
      </v-list-item-content>
    </v-list-item>
  </v-list>
</template>

<script lang="ts">
import Vue from 'vue'
import { routesCommunity } from '@/utils/routes'

export default Vue.extend({
  props: {
    miniVariant: {
      type: Boolean,
      default: false
    }
  },

  data() {
    return {
      tree: []
    }
  },

  computed: {
    getRoutesCommunity() {
      return [{ text: "Community", children: routesCommunity }];
    }
  }
})
</script>