<template>
  <div>
    <Title text="View Guild"/>
    <v-container>
      <div v-if="isLoading" class="text-center">
        <v-progress-circular
          indeterminate
          color="primary"
        ></v-progress-circular>
      </div>
    </v-container>
  </div>
</template>

<script lang="ts">
import Vue from 'vue'

export default Vue.extend({
  data() {
    return {
      isLoading: true
    }
  },
  
  async created() {},

  methods: {
    async getGuild(this: any) {
      try {
        this.$set(this, 'isLoading', true);
        this.$set(this, 'isLoading', false);
      } catch(err) {
        console.log(err);
      }
    },
  }
})
</script>