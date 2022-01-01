<template>
  <v-app id="app">
    <Header/>
    
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