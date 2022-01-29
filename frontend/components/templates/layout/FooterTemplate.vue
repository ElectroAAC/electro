<template>
  <v-footer absolute app class="text-center">
    <span> {{ getVersion }} &copy; {{ new Date().getFullYear() }} - {{ getProjectName }} </span>
  </v-footer>
</template>

<script lang="ts">
import Vue from 'vue'
export default Vue.extend({
  computed: {
    getVersion(): any {
      return process.env.version;
    },

    getProjectName(): String | undefined {
      return process.env.PROJECT_NAME;
    },
  }
})
</script>