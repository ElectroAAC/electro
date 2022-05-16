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

    <v-row v-if="!$vuetify.breakpoint.mdAndDown" class="d-flex align-center justify-center header-text">
      <v-col cols="3">
        <Logo width="100px"/>
      </v-col>
      <v-col cols="9">
        <v-row class="d-flex align-center justify-center">
          <NuxtLink to="/" class="pa-5"> HOME </NuxtLink>
          <CommunityRoutes />
          <NuxtLink to="/highscores" class="pa-5"> HIGHSCORES </NuxtLink>
          <GuildRoutes />
          <NuxtLink to="/downloads" class="pa-5"> DOWNLOAD </NuxtLink>
          <NuxtLink to="/" class="pa-5"> SHOP + </NuxtLink>
          
          <v-spacer></v-spacer>

          <AccountRoutes
            class="pa-5"
            @update-dialog="updateDialog"
          />
        </v-row>
      </v-col>
    </v-row>

    <v-row v-else class="d-flex align-center justify-center header-text">
      <v-col cols="2">
        <v-app-bar-nav-icon @click.stop="drawer = !drawer, miniVariant = false" />
        <MenuMobile 
          :drawer="drawer"
          :miniVariant="miniVariant"
          @update-drawer="updateDrawer"
        />
      </v-col>

      <v-col class="text-center" cols="8">
        <NuxtLink to="/">
          <Logo class="mt-8" width="130px"/>
        </NuxtLink>
      </v-col>

      <v-col cols="2">
        <AccountRoutes @update-dialog="updateDialog"/>
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