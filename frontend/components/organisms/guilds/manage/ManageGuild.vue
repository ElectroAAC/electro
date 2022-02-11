<template>
  <v-row class="mt-2">
    <div v-if="isLeader">
      <ManageGuildInfo />
      <ManageGuildActions class="mt-2" />
    </div>

    <v-col v-else class="text-center" cols="12">
      You cannot manage a guild that is not yours.
    </v-col>

    <v-col class="text-center" cols="12">
      <v-btn 
        text 
        class="btn btn-success-secondary"
        @click="back"
      >
        Voltar
      </v-btn>
    </v-col>
  </v-row>
</template>

<script lang="ts">
import Vue from 'vue'
import { guild } from '@/store'

export default Vue.extend({
  computed: {
    $guild() {
      return guild.$guild;
    },

    isLeader() {
      return guild.$guild.guild_leader;
    }
  },

  methods: {
    back() {
      this.$router.replace(`/guilds/view/${this.$guild.info.name}`);
    }
  }
})
</script>