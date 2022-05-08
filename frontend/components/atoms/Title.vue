<template>
  <div>
    <h2 class="widget-title text-center"> <span> {{ text }} </span> </h2>
  </div>
</template>

<script lang="ts">
import Vue from 'vue'
export default Vue.extend({
  props: {
    text: {
      type: String,
      required: true
    }
  }
})
</script>