<template>
  <v-row class="text-center pa-5">
    <v-col cols="12">
      <v-text-field
        v-model="name"
        :rules="rules"
        label="Player Name"
        type="text"
        dense
        outlined
        @change="updateInvite()"
      />
    </v-col>
  </v-row>
</template>

<script lang="ts">
import Vue from 'vue'
import { inviteGuild } from '@/store'

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
    $invite(): string {
      return inviteGuild.$inviteName;
    }
  },

  methods: {
    updateInvite() {
      inviteGuild.setInvite(this.name);
    }
  }
})
</script>