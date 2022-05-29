<template>
  <v-container>
    <v-form
      ref="form"
      class="mt-10"
      v-model="valid"
      @submit.prevent="validate"
      @keyup.native.enter="validate"
    >
      <v-row>
        <v-col class="text-center" cols="12">
          Deleting your character will make it impossible to access it again within the game.
        </v-col>

        <v-col cols="12">
          <DeleteCharacterForm />
        </v-col>

        <v-col cols="12" class="text-center">
          <v-btn
            depressed
            class="mt-5 btn btn-danger-primary"
            rounded
            @click="validate"
          >
            <v-icon>
              mdi-delete-outline
            </v-icon>
            Delete Character
          </v-btn>
        </v-col>
      </v-row>
    </v-form>
  </v-container>
</template>

<script lang="ts">
import Vue from 'vue'
import { account } from '@/store'
import { Accounts } from '@/models'

export default Vue.extend({
  data() {
    return {
      valid: true,
    }
  },

  computed: {
    $account(): Accounts {
      return account.$account;
    },
  },
  
  methods: {
    async onDelete(this: any): Promise<void> {
      const result: { status: Number, message: String} = await account.deleteCharacter(account.$dataDeleteCharacter);

      if (result.status === 200) {
        this.$toast.success(
          'Character has deleted!',
          {
            keepOnHover: true,
            duration: 2000,
            theme: "bubble",
          }
        )
        this.$router.replace('/accounts');
      }
        
      else {
        this.$toast.error(
          result.message,
          {
            keepOnHover: true,
            duration: 2000,
            theme: "bubble",
          }
        )
      }
    },
    async validate(this: any): Promise<void> {
      await this.$refs.form.validate();
      if (this.valid)
        await this.onDelete();
    }
  }
})
</script>