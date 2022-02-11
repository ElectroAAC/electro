<template>
  <v-form
    ref="form"
    v-model="valid"
    @submit.prevent="validate"
  >
    <v-row class="mt-2">
      <v-col v-if="isLeader" cols="12">
        <LeadershipForm />
      </v-col>

      <v-col v-else class="text-center" cols="12">
        You cannot manage a guild that is not yours.
      </v-col>

      <v-col class="text-center" cols="12">
        <v-btn 
          text 
          class="mr-2 btn btn-success-primary"
          @click="validate"
        >
          Change
        </v-btn>

        <v-btn 
          text 
          class="btn btn-success-secondary"
          @click="back"
        >
          Voltar
        </v-btn>
      </v-col>
    </v-row>
  </v-form>
</template>

<script lang="ts">
import Vue from 'vue'
import { account, guild, manageGuild } from '@/store'

export default Vue.extend({
  data() {
    return {
      valid: true,
    }
  },

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
      this.$router.replace(`/guild/manage/${this.$guild.info.name}`);
    },
    
    async onUpdate(this: any): Promise<void> {
      const result = await manageGuild.passLeadership({
        account_id: account.$account.id,
        guild_id: this.$guild.info.id,
        new_leader_id: this.$guild.info.owner_id
      });

      if (result.status === 200) {
        this.$toast.success(
          'Leadership changed successfully!',
          {
            keepOnHover: true,
            duration: 2000,
            theme: "bubble",
          }
        );
        this.$router.replace(`/guilds/view/${this.$guild.info.name}`);
      }
        
      else {
        this.$toast.error(
          result.message,
          {
            keepOnHover: true,
            duration: 2000,
            theme: "bubble",
          }
        );
      }
    },

    async validate(this: any) {
      await this.$refs.form.validate();
      if (this.valid)
        this.onUpdate();
    }
  }
})
</script>