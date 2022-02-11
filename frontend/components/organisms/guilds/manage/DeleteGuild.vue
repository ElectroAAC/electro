<template>
  <v-row>
    <BaseDialog
      v-if="dialogDelete"
      title="Delete Guild"
      text="Do you want to delete the guild?"
      btn_text_action="Confirm"
      :dialog="dialogDelete"
      @action-confirm="actionConfirm"
    />

    <v-row v-if="!isDeleted" class="mt-2">
      <v-col v-if="isLeader" class="text-center" cols="12">
        <v-col cols="12"> Are you sure you want delete guild? </v-col>

        <v-btn 
          text 
          class="mt-2 btn btn-danger-secondary"
          @click="dialogDelete = true"
        >
          Delete
        </v-btn>
      </v-col>

      <v-col v-else class="text-center" cols="12">
        You cannot manage a guild that is not yours.
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

    <v-row v-else>
      <Delete style="width: 50%;"/>
    </v-row>
  </v-row>
</template>

<script lang="ts">
import Vue from 'vue'
import { account, guild, manageGuild } from '@/store'

export default Vue.extend({
  data() {
    return {
      valid: true,
      isDeleted: false,
      dialogDelete: false,
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
    
    async onDelete(this: any): Promise<void> {
      const result = await manageGuild.delete({
        account_id: account.$account.id,
        guild_id: this.$guild.info.id
      });

      if (result.status === 200) {
        this.$set(this, "isDeleted", true);
        this.$toast.success(
          'Guild successfully deleted!',
          {
            keepOnHover: true,
            duration: 2000,
            theme: "bubble",
          }
        );
        setTimeout(() => {
          this.$router.replace('/guilds');
        }, 2000);
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
      this.$set(this, 'dialogDelete', false);
    },

    actionConfirm(status: boolean, action: boolean): void {
      if (action) {
        this.onDelete();
      }
      this.$set(this, 'dialogDelete', status);
    },
  }
})
</script>