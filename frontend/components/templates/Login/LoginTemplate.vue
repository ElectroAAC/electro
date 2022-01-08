<template>
  <v-row>
    <v-col cols="12" class="text-center pa-0">
      <h5 class="widget-title"> {{ getTitle }} </h5>

      <LoginDialog
        :dialog="dialog"
        @update-dialog="updateDialog"
      />
      
    </v-col>
  </v-row>
</template>

<script lang="ts">
import Vue from 'vue'
export default Vue.extend({
  data() {
    return {
      title: 'Login',
      dialog: false
    }
  },

  computed: {
    getTitle(): String {
      return this.$route.name;
    }
  },

  methods: {
    updateDialog(status: boolean): void {
      this.$set(this, 'dialog', status);
    }
  }
})
</script>