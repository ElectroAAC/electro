<template>
  <v-app-bar
    app
    id="header"
  >
    <v-row>
      <v-col cols="1"> </v-col>
      
      <v-col cols="4" class="d-flex align-center justify-center header-text"> 
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
      </v-col>

      <v-col cols="2" class="pt-8 d-flex justify-center"> 
        <NuxtLink to="/">
          <Logo width="130px"/>
        </NuxtLink>
      </v-col>

      <v-col cols="4" class="d-flex align-center justify-center header-text"> 
        <NuxtLink to="/" class="pa-5"> COMMUNITY </NuxtLink>
        <NuxtLink to="/" class="pa-5"> SHOP </NuxtLink>
        <NuxtLink to="/" class="pa-5"> DOWNLOAD </NuxtLink>
      </v-col>

      <v-col cols="1"> </v-col>
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