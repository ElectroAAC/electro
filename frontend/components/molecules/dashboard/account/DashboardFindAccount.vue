<template>
  <v-form
    ref="form"
    class="mt-8 text-center"
    v-model="valid"
    @submit.prevent="validate"
  >
    <v-text-field
      v-model="account_name"
      :rules="rules"
      label="Account Name"
      outlined
      dense
      append-icon="mdi-magnify"
      hide-details="auto"
      color="cyan accent-2"
    />
    
    <v-btn
      text 
      class="btn btn-success-secondary mt-4"
      @click="validate"
    >
      Search Account
    </v-btn>
  </v-form>
</template>

<script lang="ts">
import Vue from 'vue'

export default Vue.extend({
  data() {
    return {
      valid: true,
      account_name: "",
      rules: [
        (v: string) => !!v || 'Required field',
      ],
    }
  },

  methods: {
    async onSearch(this: any) {
      try {
        this.$router.replace('/dashboard/account/' + this.account_name);
      } catch(err) {
        console.log(err);
      }
    },

    async validate(this: any) {
      await this.$refs.form.validate();
      if (this.valid)
        this.onSearch();
    }
  }
})
</script>