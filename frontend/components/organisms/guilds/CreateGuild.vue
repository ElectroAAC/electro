<template>
  <v-container>
    <v-form
      ref="form"
      class="mt-10"
      v-model="valid"
      @submit.prevent="validate"
      @keyup.native.enter="validate"
    >
      <GuildForm />

      <v-col class="mt-5 text-center" cols="12">
        <v-btn 
          text 
          class="btn btn-success-secondary"
          @click="validate"
        >
          Create Guild
        </v-btn>
      </v-col>
    </v-form>
  </v-container>
</template>

<script lang="ts">
import Vue from 'vue'
import { createGuild } from '@/store'
export default Vue.extend({
  
  data() {
    return {
      valid: true,
    }
  },
  
  methods: {
    async onCreate(this: any): Promise<void> {
      const result: { status: Number, message: String} = await createGuild.createGuild(createGuild.$info);

      if (result.status === 200) {
        this.$toast.success(
          'Successfully created',
          {
            keepOnHover: true,
            duration: 2000,
            theme: "bubble",
          }
        )
        this.$router.replace(`/guilds/view/${createGuild.$info.name}`);
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
        await this.onCreate();
    }
  }
})
</script>