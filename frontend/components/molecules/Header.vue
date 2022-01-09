<template>
  <v-app-bar
    id="header"
    app
  >
    <LoginDialog
      :dialog="dialog"
      @update-dialog="updateDialog"
    />

    <v-row class="d-flex align-center justify-center header-text">
        <NuxtLink to="/" class="pa-5"> HOME </NuxtLink>
        <v-menu
          open-on-hover
          bottom
          offset-y
        >
          <template #activator="{ on, attrs }">
            <span
              class="header-text"
              v-bind="attrs"
              v-on="on"
            >
              <NuxtLink to="/login" class="pa-5"> ACCOUNT </NuxtLink>
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
        <NuxtLink to="/highscores" class="pa-5"> HIGHSCORES </NuxtLink>
        <NuxtLink to="/">
          <Logo class="mt-8" width="130px"/>
        </NuxtLink>
        <NuxtLink to="/" class="pa-5"> COMMUNITY </NuxtLink>
        <NuxtLink to="/" class="pa-5"> SHOP </NuxtLink>
        <NuxtLink to="/" class="pa-5"> DOWNLOAD </NuxtLink>
    </v-row>

    <v-menu
      open-on-hover
      bottom
      offset-y
    >
      <template #activator="{ on, attrs }">
        <v-btn
          text
          v-bind="attrs"
          v-on="on"
        >
          <v-icon>mdi-account</v-icon> 
        </v-btn>
      </template>
      
      <v-list class="header-list">
        <v-list-item>
          <v-list-item-title class="header-text">
            <span style="cursor: pointer;" @click="updateDialog(true)"> Login </span>
          </v-list-item-title>
        </v-list-item>
      </v-list>
    </v-menu>
    
  </v-app-bar>
</template>

<script lang="ts">

export default {
  data() {
    return {
      dialog: false,
      menu_account: [
        {
          text: "Login",
          to: "/login"
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
  },
  
  methods: {
    updateDialog(status: boolean): void {
      this.$set(this, 'dialog', status);
    }
  }
}
</script>