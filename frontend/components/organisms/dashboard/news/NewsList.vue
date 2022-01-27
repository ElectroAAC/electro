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
      <NuxtLink to="/dashboard/news/create"> Add New Post </NuxtLink>
    </v-btn>
    <NewsTable class="mt-5"/>
  </v-container>
</template>