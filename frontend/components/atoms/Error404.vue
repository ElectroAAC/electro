<template>
  <lottie-animation path="./404-error.json" />
</template>

<script lang="ts">
import Vue from 'vue'
import LottieAnimation from "lottie-vuejs/src/LottieAnimation.vue";

export default Vue.extend({
  components: {
    LottieAnimation
  },

  data() {
    return {
      options: [
        {
          name: "error",
          path: "./404-error.json",
        },
      ],
    };
  },
})
</script>