<template>
  <v-form
    ref="form"
    v-model="valid"
    class="pl-4 pr-4"
    @submit.prevent="validate"
    @keyup.native.enter="validate"
  >
    <v-text-field
      :rules="rules.required"
      label="Username"
      type="text"
      dense
      outlined
      rounded
      required
    />

    <v-text-field
      :rules="rules.required"
      label="Password"
      dense
      outlined
      rounded
      required
      :type="showPassword ? 'text' : 'password'"
      :append-icon="showPassword ? 'mdi-eye' : 'mdi-eye-off'"
      @click:append="showPassword = !showPassword"
    />

    <v-btn
      depressed
      class="btn btn-success-primary"
      width="100%"
      rounded
      @click="validate"
    >
      Login
    </v-btn>
  </v-form>
</template>

<script lang="ts">
import Vue from 'vue'
export default Vue.extend({
  data() {
    return {
      valid: true,
      showPassword: false,
      rules: {
        required: [
          (v: string) => !!v || 'Required field',
        ],
      },
    }
  },

  methods: {
    async validate(): Promise<void> {
      await this.$refs.form.validate();
    }
  }
})
</script>