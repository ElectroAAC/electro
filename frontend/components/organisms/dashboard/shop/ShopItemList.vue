<template>
  <v-container class="text-center">
    <v-btn 
      text 
      class="btn btn-success-secondary"
      rounded
    >
      <v-icon color="green">
        mdi-plus
      </v-icon>
      <NuxtLink to="/dashboard/shop/item/create"> Add New Item </NuxtLink>
    </v-btn>

    <ShopItemTable class="mt-5"/>
  </v-container>
</template>