<template>
  <v-row class="text-center pa-5">
    <v-col cols="12">
      <v-autocomplete
        v-model="$guild.info.owner_id"
        :items="$guildMembers"
        :rules="rules"
        label="Leadership"
        dense
        outlined
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
    },

    $guildMembers() {
      return guild.$guild.guild_members.map((member) => ({
        value: member.id,
        text: member.name
      }));
    },
  }
})
</script>