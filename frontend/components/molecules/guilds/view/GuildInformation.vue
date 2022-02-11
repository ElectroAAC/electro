<template>
  <v-container>
    <v-col class="text-center" cols="12">
      <h3> Guild Information</h3>
    </v-col>

    <v-col class="text-center" cols="12">
      <p>
        <NuxtLink :to="`/character/${$guild.info.owner_name}`"> {{ $guild.info.owner_name }} </NuxtLink> is guild leader of <strong> {{ $guild.info.name }} </strong>
      </p>
      
      <p>
        The guild was founded on {{ date() }}
      </p>
      
      <v-col v-if="$guild.guild_leader" class="text-center" cols="12">
        <v-btn 
          text 
          class="btn btn-success-secondary"
          @click="goToManage"
        >
          Manage Guild
        </v-btn>
      </v-col>
      
      <v-col v-if="$guild.guild_leader || $guild.guild_vice" class="text-center" cols="12">
        <v-btn 
          v-if="$guild.guild_leader || $guild.guild_vice"
          text 
          class="ma-1 btn btn-success-secondary"
          @click="invitePlayer"
        >
          Invite Player
        </v-btn>

        <v-btn 
          v-if="$guild.guild_leader || $guild.guild_vice"
          text 
          class="ma-1 btn btn-success-secondary"
          @click="cancelInvite"
        >
          Cancel Invite
        </v-btn>
      </v-col>

      <v-col v-if="$guild.invites.length" cols="12">
        <v-btn 
          v-if="$guild.guild_leader"
          text 
          class="btn btn-success-secondary"
          @click="acceptInvite"
        >
          Accept Invite
        </v-btn>
      </v-col>
    </v-col>
  </v-container>
</template>

<script lang="ts">
import Vue from 'vue'
import moment from 'moment'
import { guild } from '@/store'

export default Vue.extend({
  computed: {
    $guild(): any {
      return guild.$guild;
    }
  },

  methods: {
    date(this: any) {
      return moment(this.$guild.info.creation_data * 1000).format("LL");
    },
    goToManage(): void {
      this.$router.replace(`/guild/manage/${this.$guild.info.name}`);
    },
    invitePlayer(): void {
      this.$router.replace(`/guild/invite/${this.$guild.info.name}`);
    },
    cancelInvite(): void {
      this.$router.replace(`/guild/cancel-invite/${this.$guild.info.name}`);
    },
    acceptInvite(): void {
      this.$router.replace(`/guild/accept-invite/${this.$guild.info.name}`);
    },
  }
})
</script>