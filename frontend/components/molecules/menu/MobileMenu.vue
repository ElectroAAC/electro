<template>
  <v-menu bottom right>
    <template v-slot:activator="{ on, attrs }">
      <v-btn
        icon
        v-bind="attrs"
        v-on="on"
      >
        <v-icon>mdi-menu</v-icon>
      </v-btn>
    </template>

    <v-list>
      <v-list-item>
        <v-list-item-title> <NuxtLink to="/" class="pa-5"> HOME </NuxtLink> </v-list-item-title>
      </v-list-item>

      <v-list-item>
        <v-list-item-title> <CommunityRoutes class="pa-5"/> </v-list-item-title>
      </v-list-item>

      <v-list-item>
        <v-list-item-title> <NuxtLink to="/highscores" class="pa-5"> HIGHSCORES </NuxtLink> </v-list-item-title>
      </v-list-item>

      <v-list-item>
        <v-list-item-title> <NuxtLink to="/guilds" class="pa-5"> GUILDS </NuxtLink> </v-list-item-title>
      </v-list-item>

      <v-list-item>
        <v-list-item-title> <NuxtLink to="/" class="pa-5"> SHOP </NuxtLink> </v-list-item-title>
      </v-list-item>

      <v-list-item>
        <v-list-item-title> <NuxtLink to="/downloads" class="pa-5"> DOWNLOAD </NuxtLink> </v-list-item-title>
      </v-list-item>
    </v-list>
  </v-menu>
</template>