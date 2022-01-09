<template>
  <div class="auth-title">
    <span class="small-text"> {{ small_text }} </span>
    <h1 class="big-text"> {{ big_text }} </h1>
  </div>
</template>

<script lang="ts">
import Vue from 'vue'
export default Vue.extend({
  props: {
    small_text: {
      type: String,
      required: true
    },
    big_text: {
      type: String,
      required: true
    }
  }
})
</script>