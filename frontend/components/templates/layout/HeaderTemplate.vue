<template>
  <v-app-bar
    id="header"
    :clipped-left="false"
    fixed
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
      <v-col cols="3">
        <Logo width="100px"/>
      </v-col>
      <v-col cols="9">
        <v-row class="d-flex align-center justify-center">
          <NuxtLink to="/" class="pa-5"> HOME </NuxtLink>
          <CommunityRoutes />
          <NuxtLink to="/highscores" class="pa-5"> HIGHSCORES </NuxtLink>
          <GuildRoutes />
          <NuxtLink to="/" class="pa-5"> SHOP + </NuxtLink>
          <NuxtLink to="/downloads" class="pa-5"> DOWNLOAD </NuxtLink>
          
          <v-spacer></v-spacer>

          <AccountRoutes
            class="pa-5"
            @update-dialog="updateDialog"
          />
        </v-row>
      </v-col>
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
      drawer: false,
      miniVariant: false,
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
    
    updateDrawer(this: any, status: boolean): void {
      this.$set(this, 'drawer', status);
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