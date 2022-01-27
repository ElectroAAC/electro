<template>
  <div class="container-error text-center mt-15">
    <div class="text-center">
      <Error404 width="70%"/>
    </div>
    <h1 v-if="error.statusCode === 404">404 Page not found</h1>
    <h1 v-else>An error occurred</h1>
    <NuxtLink to="/">Home page</NuxtLink>
  </div>
</template>

<script>
  export default {
    props: [
      'error'
    ],
    layout: 'error' // you can set a custom layout for the error page
  }
</script>

<style lang="scss" scoped>
.container-error {
  display: grid;
  justify-content: center;
  align-items: center;
}
</style>