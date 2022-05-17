<template>
  <v-row class="mt-2">

    <GuildHeader />

    <v-col cols="12">
      <GuildInformation />

      <GuildMembers />
    </v-col>

    <v-col class="text-center" cols="12">
      <v-btn 
        v-if="$inGuild.length"
        text 
        class="btn btn-danger-secondary"
        @click="goLeave"
      >
        Leave Guild
      </v-btn>
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

    $inGuild() {
      return guild.$guild.players_from_account_in_guild;
    },
  },

  methods: {
    back() {
      this.$router.replace('/guilds');
    },
    goLeave() {
      this.$router.replace(`/guild/leave/${this.$guild.info.name}`);
    },
  }
})
</script>