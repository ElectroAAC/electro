<template>
  <div class="container">
    <v-alert
      dense
      outlined
      type="error"
    >
      {{ text }}
    </v-alert>

    <v-row class="text-center">
      <v-col cols="3"></v-col>
      <v-col cols="6">
        <v-btn
          text
          class="btn btn-success-secondary"
          @click="back()"
        >
          Back
        </v-btn>
      </v-col>
      <v-col cols="3"></v-col>
    </v-row>
  </div>
</template>

<script lang="ts">
import Vue from 'vue'
export default Vue.extend({
  props: {
    text: {
      type: String,
      default: ""
    },
    to: {
      type: String,
      default: ""
    }
  },

  methods: {
    back(): void {
      this.$router.replace(this.to);
    },
  }
})
</script>