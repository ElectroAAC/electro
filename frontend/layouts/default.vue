<template>
  <v-app id="app">
    <HeaderTemplate />
    
    <v-main id="main">
      <v-row class="ma-0 mt-15">
        <v-col cols="1"></v-col>
        <v-col :cols="!$vuetify.breakpoint.mdAndDown ? '8' : '10'" class="content pa-0">
          <Nuxt/>
        </v-col>
        <v-col v-if="!$vuetify.breakpoint.mdAndDown" cols="2" class="side-bar ml-5 pa-0">
          <Sidebar />
        </v-col>
        <v-col cols="1"></v-col>
      </v-row>
    </v-main>

    <FooterTemplate />
  </v-app>
</template>

<script lang="ts">
import Vue from 'vue'
import { $cookies } from '@/utils/nuxt-instance'
import { account } from '@/store'
export default Vue.extend({
  name: 'DefaultLayout',

  data() {
    return {
      fixed: false,
    }
  },

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