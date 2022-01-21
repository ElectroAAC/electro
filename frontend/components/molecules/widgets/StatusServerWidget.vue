<template>
  <aside class="widget">
    <h5 class="widget-title"> Status </h5>
    <v-container class="d-flex justify-center text-center">
      Players Online: <br> <br> 
      <NuxtLink to="/online"> {{ playersOnline }} / {{ maxPlayers}} </NuxtLink>
    </v-container>
  </aside>
</template>

<script lang="ts">
export default {
  data() {
    return {
      status: false,
      playersOnline: 150,
      maxPlayers: 500
    }
  }
}
</script>