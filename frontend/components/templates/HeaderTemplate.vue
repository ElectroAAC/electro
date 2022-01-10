<template>
  <v-app-bar
    id="header"
    app
  >
     <CreateAccountDialog
      v-if="$isRegistering"
      :dialog="dialog"
      @update-dialog="updateDialog"
    />

    <LoginDialog
      v-else
      :dialog="dialog"
      @update-dialog="updateDialog"
    />

    <v-row class="d-flex align-center justify-center header-text">
      <NuxtLink to="/" class="pa-5"> HOME </NuxtLink>
      <NuxtLink to="/" class="pa-5"> COMMUNITY </NuxtLink>
      <NuxtLink to="/highscores" class="pa-5"> HIGHSCORES </NuxtLink>
      <NuxtLink to="/">
        <Logo class="mt-8" width="130px"/>
      </NuxtLink>
      <NuxtLink to="/" class="pa-5"> GUILDS </NuxtLink>
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
          class="header-text"
          v-bind="attrs"
          v-on="on"
        >
          <v-icon>mdi-account</v-icon> 
          <NuxtLink to="/accounts"> {{ $account.name }} </NuxtLink>
        </v-btn>
      </template>
      
      <v-list class="header-list">
        <v-list-item v-if="!$account.name">
          <v-list-item-title class="header-text">
            <span style="cursor: pointer;" @click="updateDialog(true)"> Login </span>
          </v-list-item-title>
        </v-list-item>

        <v-list-item
          v-for="(item, idx) in menu_account"
          v-else
          :key="idx"
        >
          <v-list-item-title class="header-text">
            <NuxtLink :to="item.to"> {{ item.text }} </NuxtLink>
          </v-list-item-title>
        </v-list-item>

        <v-list-item v-if="$account.name">
          <v-list-item-title class="header-text">
            <span style="cursor: pointer;" @click="onLogout()"> Logout </span>
          </v-list-item-title>
        </v-list-item>
      </v-list>
    </v-menu>
    
  </v-app-bar>
</template>

<script lang="ts">
import { auth, account, accountRegister } from '@/store'
import { Accounts } from '@/models'
export default {
  data() {
    return {
      dialog: false,
      menu_account: [
        {
          text: "Manage account",
          to: "/accounts"
        },
        {
          text: "Create Character",
          to: "/account/create-character"
        },
      ]
    }
  },

  watch: {
    $token(this: any) {
      this.updateDialog(false);
    }
  },

  computed: {
    $account(): Accounts {
      return account.$account;
    },
    
    $token() {
      return auth.$token;
    },

    $isRegistering(): boolean {
      return accountRegister.$isRegistering;
    }
  },
  
  methods: {
    updateDialog(this: any, status: boolean): void {
      this.$set(this, 'dialog', status);
    },

    onLogout(this: any): void {
      auth.destroy();
      if (this.$route && this.$route.fullPath !== "/") {
        console.log(this.$route)
        this.$router.push("/")
      }
    }
  }
}
</script>