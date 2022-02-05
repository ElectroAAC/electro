<template>
  <v-list :class="miniVariant ? '' : 'ml-4 mr-4'">
    <div v-for="(link, i) in links" :key="i">
      <v-list-item
        v-if="!link.subLinks"
        :key="i"
        :to="link.to"
        class="mt-2 text-left"
      >
        <v-list-item-action>
          <v-icon>{{ link.icon }}</v-icon>
        </v-list-item-action>
        <v-list-item-title v-text="link.text" />
      </v-list-item>

      <v-list-group
        v-else
        :key="link.text"
        no-action
        class="mt-2 text-left"
      >
        <template v-slot:activator>
          <v-list-item-action>
            <v-icon>{{ link.icon }}</v-icon>
          </v-list-item-action>
          <v-list-item-title>{{ link.text }}</v-list-item-title>
        </template>

        <v-list-item
          v-for="sublink in link.subLinks"
          :to="sublink.to"
          :key="sublink.text"
          class="mt-2 text-left"
        >
          <v-list-item-action>
            <v-icon>{{ sublink.icon }}</v-icon>
          </v-list-item-action>
          <v-list-item-title v-text="sublink.text" />
        </v-list-item>
      </v-list-group>
    </div>
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
      links: [
        {
          to: '/',
          icon: 'mdi-home',
          text: 'Home',
        },
        {
          icon: 'mdi-khanda',
          text: 'Community',
          subLinks: [...routesCommunity]
        },
        {
          to: '/highscores',
          icon: 'mdi-trophy',
          text: 'Highscores',
        },
        {
          to: '/guilds',
          icon: 'mdi-khanda',
          text: 'Guilds',
        },
        {
          to: '/',
          icon: 'mdi-cart-outline',
          text: 'Shop',
        },
        {
          to: '/downloads',
          icon: 'mdi-download-outline',
          text: 'Download',
        },
      ]
    }
  }
})
</script>