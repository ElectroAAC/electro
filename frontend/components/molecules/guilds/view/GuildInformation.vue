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
        >
          <NuxtLink :to="`/guild/manage/${$guild.info.name}`"> Manage Guild </NuxtLink>
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
    }
  }
})
</script>