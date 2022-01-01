<template>
  <v-app id="app">
    <v-app-bar
      app
      id="header"
    >
      <v-row>
        <v-col cols="1"> </v-col>
        <v-col cols="4" class="d-flex align-center justify-center"> 
          <NuxtLink to="/" class="pa-5"> HOME </NuxtLink>
          <NuxtLink to="/" class="pa-5"> ACCOUNT </NuxtLink>
          <NuxtLink to="/" class="pa-5"> HIGHSCORES </NuxtLink>
        </v-col>
        <v-col cols="2" class="pt-8 d-flex justify-center"> 
          <NuxtLink to="/">
            <Logo width="130px"/>
          </NuxtLink>
        </v-col>
        <v-col cols="4" class="d-flex align-center justify-center"> 
          <NuxtLink to="/" class="pa-5"> COMMUNITY </NuxtLink>
          <NuxtLink to="/" class="pa-5"> SHOP </NuxtLink>
          <NuxtLink to="/" class="pa-5"> DOWNLOAD </NuxtLink>
        </v-col>
        <v-col cols="1"> </v-col>
      </v-row>
    </v-app-bar>
    
    <v-main id="main">
      <v-row class="mt-15">
        <v-col cols="2"></v-col>
        <v-col cols="6" class="content">
          <Nuxt/>
        </v-col>
        <v-col cols="2" class="side-bar ml-5"> Menu lateral <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br></v-col>
        <v-col cols="2"></v-col>
      </v-row>
    </v-main>
  </v-app>
</template>

<style lang="scss" scoped>
#app {
  margin: 0;
  padding: 0;
}
</style>