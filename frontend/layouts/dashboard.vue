<template>
  <v-app id="dashboard">
    <v-app-bar
      :clipped-left="clipped"
      fixed
      app
    > 
      <v-app-bar-nav-icon v-if="!$vuetify.breakpoint.mdAndDown" color="white" @click.stop="miniVariant = !miniVariant" />
      <v-app-bar-nav-icon v-else color="white" @click.stop="drawer = !drawer, miniVariant = false" />
      
      <v-spacer></v-spacer>
      
      <v-tooltip bottom>
        <template v-slot:activator="{ on, attrs }">
          <v-btn
            text
            v-bind="attrs"
            v-on="on"
            @click="onLogout()"
          >
            <v-icon color="white"> mdi-logout </v-icon>
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
      class="dashboard-drawer text-center"
    >
      <div> 
        <NuxtLink to="/">
          <Logo :class="miniVariant ? 'mt-6' : ''" :mini="miniVariant" :width="miniVariant ? '40px' : '85px'"/> 
        </NuxtLink>
      </div>
      
      <v-list :class="miniVariant ? '' : 'ml-4 mr-4'">
        <div v-for="(link, i) in getRoutesSideBar" :key="i">
          <v-list-item
            v-if="!link.subLinks"
            :key="i"
            :to="link.to"
            class="mt-2 text-left"
          >
            <v-list-item-action>
              <v-icon>{{ link.icon }}</v-icon>
            </v-list-item-action>
            <v-list-item-title class="dashboard-side-bar" v-text="link.text" />
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

              <v-list-item-title class="dashboard-side-bar" v-text="link.text" />
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
    </v-navigation-drawer>

    <v-main>
      <v-container class="mt-3">
        <Nuxt />
      </v-container>
    </v-main>

    <FooterTemplate />
  </v-app>
</template>

<script lang="ts">
import Vue from 'vue'
import { auth } from '@/store'
import { routesDashboard } from '@/utils/routes'

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

    getRoutesSideBar(): {
      icon: String,
      text: String,
      to: String,
      subLinks?: {
        icon: String,
        text: String,
        to: String,
      }[]
    }[] {
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