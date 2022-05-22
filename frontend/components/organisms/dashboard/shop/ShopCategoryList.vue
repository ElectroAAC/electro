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
      <NuxtLink to="/dashboard/shop/category/create"> Add New Category </NuxtLink>
    </v-btn>

    <ShopCategoryTable class="mt-5"/>
  </v-container>
</template>