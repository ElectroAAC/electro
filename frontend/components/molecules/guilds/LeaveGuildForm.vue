<template>
  <v-row class="text-center pa-5">
    {{ $invite }}
  </v-row>
</template>

<script lang="ts">
import Vue from 'vue'
import { guild, inviteGuild } from '@/store'

export default Vue.extend({
  data() {
    return {
      name: "",
      rules: [
        (v: string) => !!v || 'Required field',
      ],
    }
  },

  computed: {
    $invite(): any {
      return inviteGuild.$acceptInvitation;
    },

    getInvites(): Object[] {
      return guild.$guild.invites.map((invite) => ({
        value: invite.id,
        text: invite.name
      }));
    }
  },

  methods: {
    acceptInvite() {
      inviteGuild.setAccept(this.name);
    }
  }
})
</script>