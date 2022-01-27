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

    <v-row v-if="$device.isDesktop" class="d-flex align-center justify-center header-text">
      <StatusServer />

      <v-spacer></v-spacer>

        <NuxtLink to="/" class="pa-5"> HOME </NuxtLink>
        <CommunityRoutes class="pa-5"/>
        <NuxtLink to="/highscores" class="pa-5"> HIGHSCORES </NuxtLink>
        <NuxtLink to="/">
          <Logo class="mt-8" width="130px"/>
        </NuxtLink>
        <NuxtLink to="/guilds" class="pa-5"> GUILDS </NuxtLink>
        <NuxtLink to="/" class="pa-5"> SHOP </NuxtLink>
        <NuxtLink to="/downloads" class="pa-5"> DOWNLOAD </NuxtLink>

      <v-spacer></v-spacer>

      <AccountRoutes @update-dialog="updateDialog"/>
    </v-row>

    <v-row v-else class="d-flex align-center justify-center header-text">
      <MobileMenu />

      <v-spacer></v-spacer>

      <NuxtLink to="/">
        <Logo class="mt-8" width="130px"/>
      </NuxtLink>

      <v-spacer></v-spacer>

      <AccountRoutes @update-dialog="updateDialog"/>
    </v-row>
  </v-app-bar>
</template>

<script lang="ts">
import { auth, account, accountRegister } from '@/store'
import { Accounts } from '@/models'

export default {
  data() {
    return {
      dialog: false,
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
        this.$router.push("/")
      }
    }
  }
}
</script>