<template>
  <v-app id="app">
    <HeaderTemplate />
    
    <v-main id="main">
      <v-row class="ma-0 mt-15">
        <v-col cols="1"></v-col>
        <v-col cols="7" class="content">
          <Nuxt/>
        </v-col>
        <v-col cols="3" class="side-bar ml-5 pa-0">
          <SearchPlayerWidget />
          <StatusServerWidget class="mt-2"/>
          <TrailerWidget class="mt-2"/>
          <HighscoresWidget class="mt-2"/>
        </v-col>
        <v-col cols="1"></v-col>
      </v-row>
    </v-main>
    
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
      console.log(account.$account);
    }
  }
})
</script>

<style lang="scss" scoped>
#app {
  margin: 0;
  padding: 0;
}
</style>