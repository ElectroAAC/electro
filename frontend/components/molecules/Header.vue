<template>
  <v-app-bar
    app
    id="header"
  >
    <v-row class="d-flex align-center justify-center header-text">
        <NuxtLink to="/" class="pa-5"> HOME </NuxtLink>
        <v-menu
          open-on-hover
          bottom
          offset-y
        >
          <template v-slot:activator="{ on, attrs }">
            <span
              v-bind="attrs"
              v-on="on"
              class="header-text"
            >
              <NuxtLink to="/" class="pa-5"> ACCOUNT </NuxtLink>
            </span>
          </template>

          <v-list class="header-list">
            <v-list-item
              v-for="(item, idx) in menu_account"
              :key="idx"
            >
              <v-list-item-title class="header-text">
                <NuxtLink :to="item.to"> {{ item.text }} </NuxtLink>
              </v-list-item-title>
            </v-list-item>
          </v-list>
        </v-menu>
        <NuxtLink to="/" class="pa-5"> HIGHSCORES </NuxtLink>
        <NuxtLink to="/">
          <Logo class="mt-8" width="130px"/>
        </NuxtLink>
        <NuxtLink to="/" class="pa-5"> COMMUNITY </NuxtLink>
        <NuxtLink to="/" class="pa-5"> SHOP </NuxtLink>
        <NuxtLink to="/" class="pa-5"> DOWNLOAD </NuxtLink>
    </v-row>
  </v-app-bar>
</template>

<script lang="ts">

export default {
  data() {
    return {
      menu_account: [
        {
          text: "Login",
          to: "/"
        },
        {
          text: "Create Account",
          to: "/"
        },
        {
          text: "Lost Account?",
          to: "/"
        },
      ]
    }
  }
}
</script>