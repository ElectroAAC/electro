<template>
  <lottie-animation path="./loading.json" :speed="2"/>
</template>

<script lang="ts">
import Vue from 'vue'
import LottieAnimation from "lottie-vuejs/src/LottieAnimation.vue";

export default Vue.extend({
  components: {
    LottieAnimation
  },
})
</script>