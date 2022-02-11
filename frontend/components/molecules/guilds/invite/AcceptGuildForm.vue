<template>
  <v-row class="text-center pa-5">
    {{ $invite }}
    <v-col cols="12">
      <v-autocomplete
        :value="
          getInvites.some((character) => character.text === name)
            ? {
                value: getInvites.find(
                  (character) => character.text === name,
                ).value,
                text: name,
              }
            : null"
        :items="getInvites"
        :rules="rules"
        label="Player Name"
        type="text"
        return-object
        dense
        outlined
        @change="($event) => {
          name = $event.text;
          acceptInvite();
        }"
      />
    </v-col>
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