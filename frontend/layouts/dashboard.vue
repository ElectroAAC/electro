<template>
  <v-app id="dashboard">
    <v-app-bar
      :clipped-left="clipped"
      fixed
      app
    > 
      <v-app-bar-nav-icon v-if="!$vuetify.breakpoint.mdAndDown" @click.stop="miniVariant = !miniVariant" />
      <v-app-bar-nav-icon v-else @click.stop="drawer = !drawer, miniVariant = false" />
      
      <v-spacer></v-spacer>
      
      <v-tooltip bottom>
        <template v-slot:activator="{ on, attrs }">
          <v-btn
            text
            v-bind="attrs"
            v-on="on"
            @click="onLogout()"
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
      absolute
      app
      class="text-center"
    >
      <div> 
        <NuxtLink to="/">
          <Logo :class="miniVariant ? 'mt-6' : ''" :mini="miniVariant" :width="miniVariant ? '40px' : '85px'"/> 
        </NuxtLink>
      </div>
      
      <v-list :class="miniVariant ? '' : 'ml-4 mr-4'">
        <v-list-item
          v-for="(item, i) in getItems"
          :key="i"
          :to="item.to"
          router
          exact
        >
          <v-tooltip right>
            <template v-slot:activator="{ on, attrs }">
              <v-list-item-action
                class="text-center"
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

    <FooterTemplate />
  </v-app>
</template>

<script lang="ts">
import Vue from 'vue'
import { auth } from '@/store'
import { routesDashboard } from '@/utils/enum'

export default Vue.extend({
  middleware: 'dashboard',
  data () {
    return {
      clipped: false,
      drawer: true,
      miniVariant: false,
      right: true,
      rightDrawer: false,
      title: 'Claria'
    }
  },

  computed: {
    getVersion(): any {
      return process.env.version;
    },

    getProjectName(): String | undefined {
      return process.env.PROJECT_NAME;
    },

    getItems(): {}[] {
      return routesDashboard;
    }
  },

  methods: {
    onLogout(this: any): void {
      auth.destroy();
      if (this.$route && this.$route.fullPath !== "/") {
        this.$router.push("/")
      }
    }
  }
})
</script>

<style lang="scss" scoped>
.theme--light.v-list {
  background: inherit !important;
}
#app {
  background: transparent !important;
}
</style>