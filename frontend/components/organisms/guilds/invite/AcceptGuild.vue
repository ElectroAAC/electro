<template>
  <v-form
    ref="form"
    v-model="valid"
    @submit.prevent="validate"
  >
    <v-row v-if="!isSuccess" class="mt-2">
      <v-col cols="12">
        <AcceptGuildForm />
      </v-col>

      <v-col class="text-center" cols="12">
        <v-btn 
          text 
          class="mr-2 btn btn-success-primary"
          @click="validate"
        >
          Accept
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

    <v-row v-else>
      <Success style="width: 50%;"/>
    </v-row>
  </v-form>
</template>

<script lang="ts">
import Vue from 'vue'
import { account, guild, inviteGuild } from '@/store'

export default Vue.extend({
  data() {
    return {
      valid: true,
      isSuccess: false,
    }
  },

  computed: {
    $guild() {
      return guild.$guild;
    },

    isLeaderOrVice() {
      return (guild.$guild.guild_vice || guild.$guild.guild_leader);
    }
  },

  methods: {
    back() {
      this.$router.replace(`/guilds/view/${this.$guild.info.name}`);
    },
    
    async onUpdate(this: any): Promise<void> {
      const result = await inviteGuild.accept({
        guild_id: this.$guild.info.id,
        character_invitation: inviteGuild.$acceptInvitation
      });

      if (result.status === 200) {
        this.$set(this, "isSuccess", true);
        this.$toast.success(
          'Invitation successfully accepted!',
          {
            keepOnHover: true,
            duration: 2000,
            theme: "bubble",
          }
        );
        setTimeout(() => {
          this.back();
        }, 1000);
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