<template>
  <v-app id="dashboard">
    <v-app-bar
      :clipped-left="clipped"
      fixed
      app
    > 
      <v-app-bar-nav-icon @click.stop="miniVariant = !miniVariant" />
      
      <v-spacer></v-spacer>
      
      <v-tooltip bottom>
        <template v-slot:activator="{ on, attrs }">
          <v-btn
            text
            v-bind="attrs"
            v-on="on"
          >
            <v-icon> mdi-logout </v-icon>
          </v-btn>
        </template>
        <span> Logout</span>
      </v-tooltip>
    </v-app-bar>

    <v-navigation-drawer
      v-model="drawer"
      :mini-variant="miniVariant"
      :clipped="clipped"
      fixed
      app
      class="text-center"
    >
      <div> 
        <NuxtLink to="/">
          <Logo :class="miniVariant ? 'mt-6' : ''" :mini="miniVariant" :width="miniVariant ? '40px' : '85px'"/> 
        </NuxtLink>
      </div>
      
      <v-list>
        <v-list-item
          v-for="(item, i) in items"
          :key="i"
          :to="item.to"
          router
          exact
        >
          <v-tooltip right>
            <template v-slot:activator="{ on, attrs }">
              <v-list-item-action
                v-bind="attrs"
                v-on="on"
              >
                <v-icon>{{ item.icon }}</v-icon>
              </v-list-item-action>
            </template>
            <span> {{ item.title }} </span>
          </v-tooltip>
          <v-list-item-content>
            <v-list-item-title class="dashboard-menu-text" v-text="item.title" />
          </v-list-item-content>
        </v-list-item>
      </v-list>
    </v-navigation-drawer>

    <v-main>
      <v-container>
        <Nuxt />
      </v-container>
    </v-main>

    <v-footer
      :absolute="!fixed"
      app
    >
      <span> &copy; {{ new Date().getFullYear() }}</span>
    </v-footer>
  </v-app>
</template>

<script lang="ts">
import Vue from 'vue'
export default Vue.extend({
  data () {
    return {
      clipped: false,
      drawer: true,
      fixed: false,
      items: [
        {
          icon: 'mdi-home',
          title: 'Home',
          to: '/dashboard',
        },
        {
          icon: 'mdi-view-dashboard-outline',
          title: 'Customize',
          to: '/dashboard/customize'
        },
        {
          icon: 'mdi-newspaper',
          title: 'News',
          to: '/dashboard/news'
        },
        {
          icon: 'mdi-account-multiple',
          title: 'Accounts',
          to: '/dashboard/accounts'
        },
        {
          icon: 'mdi-account-cowboy-hat',
          title: 'Players',
          to: '/dashboard/players'
        },
        {
          icon: 'mdi-shield-sun-outline',
          title: 'Guilds',
          to: '/dashboard/guilds'
        },
        {
          icon: 'mdi-axe',
          title: 'Items',
          to: '/dashboard/items'
        },
        {
          icon: 'mdi-rodent',
          title: 'Monsters',
          to: '/dashboard/monsters'
        },
        {
          icon: 'mdi-cart',
          title: 'Shop',
          to: '/dashboard/shop'
        },
        {
          icon: 'mdi-text-box-outline',
          title: 'Logs',
          to: '/dashboard/logs'
        },
      ],
      miniVariant: false,
      right: true,
      rightDrawer: false,
      title: 'Claria'
    }
  },
})
</script>