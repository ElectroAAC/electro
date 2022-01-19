<template>
  <v-app id="app">
    <HeaderTemplate />
    
    <v-main id="main">
      <v-row class="ma-0 mt-15">
        <v-col cols="1"></v-col>
        <v-col cols="7" class="content pa-0">
          <Nuxt/>
        </v-col>
        <v-col cols="3" class="side-bar ml-5 pa-0">
          <Sidebar />
        </v-col>
        <v-col cols="1"></v-col>
      </v-row>
    </v-main>

      <v-footer
        :absolute="!fixed"
        app
        class="text-center"
      >
        <span> {{ getVersion }} &copy; {{ new Date().getFullYear() }} - {{ getProjectName }} </span>
      </v-footer>
    
  </v-app>
</template>

<script lang="ts">
import Vue from 'vue'
import { $cookies } from '@/utils/nuxt-instance'
import { account } from '@/store'
export default Vue.extend({
  name: 'DefaultLayout',

  async created() {
    if ($cookies.get('token')) {
      await account.get();
    }
  },

  computed: {
    getVersion(): any {
      return process.env.version;
    },

    getProjectName(): String | undefined {
      return process.env.PROJECT_NAME;
    }
  }
})
</script>

<style lang="scss" scoped>
#app {
  margin: 0;
  padding: 0;
}
.theme--light.v-footer {
  background: transparent !important;
}
</style>