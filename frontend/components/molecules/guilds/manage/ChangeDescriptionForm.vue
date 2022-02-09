<template>
  <v-row class="text-center pa-5">
    <v-col cols="12">
      <v-textarea
        v-model="$guild.info.description"
        :rules="rules"
        label="MOTD"
        dense
        outlined
        auto-grow
        rows="1"
        row-height="5"
        maxlength="255"
      />
    </v-col>
  </v-row>
</template>

<script lang="ts">
import Vue from 'vue'
import { guild } from '@/store'
export default Vue.extend({
  data() {
    return {
      rules: [
        (v: string) => !!v || 'Required field',
      ],
    }
  },

  computed: {
    $guild(): any {
      return guild.$guild;
    }
  }
})
</script>