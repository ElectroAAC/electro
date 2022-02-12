<template>
  <v-container class="text-center pa-5">
    <BaseDialog
      v-if="dialogDelete"
      title="Delete Invite"
      text="Do you want to delete the invite?"
      btn_text_action="Confirm"
      :dialog="dialogDelete"
      @action-confirm="actionConfirm"
    />
    <div v-if="$invites.length">
      <v-row v-for="(invite, idx) in $invites" :key="idx" class="actions-guild mb-2">
        <v-col style="display: grid; align-items: center;" :cols="!$vuetify.breakpoint.xsOnly ? '8' : '12'"> {{ invite.name }} </v-col>
        <v-col :cols="!$vuetify.breakpoint.xsOnly ? '4' : '12'"> 
          <v-btn 
            text 
            class="btn btn-success-secondary"
            @click="onDelete(invite.name)"
          >
            Cancel Invite
          </v-btn>
        </v-col>
      </v-row>
    </div>

    <div v-else>
      <Empty style="width: 50% !important;" />
      There are no open invites.
    </div>
  </v-container>
</template>

<script lang="ts">
import Vue from 'vue'
import { guild, inviteGuild } from '@/store'

export default Vue.extend({
  data() {
    return {
      name: "",
      dialogDelete: false,
    }
  },

  computed: {
    $invites() {
      return guild.$invites;
    },
  },

  methods: {
    async cancelInvite() {
      const result = await inviteGuild.cancel({
        guild_id: guild.$guild.info.id,
        character_invitation: this.name
      });

      if (result.status === 200) {
        this.$toast.success(
          'Invitation canceled successfully!',
          {
            keepOnHover: true,
            duration: 2000,
            theme: "bubble",
          }
        );
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

    onDelete(name: String) {
      this.$set(this, 'name', name);
      this.$set(this, 'dialogDelete', true);
    },

    actionConfirm(status: boolean, action: boolean): void {
      if (action) {
        this.cancelInvite();
      }
      this.$set(this, 'dialogDelete', status);
    },
  }
})
</script>