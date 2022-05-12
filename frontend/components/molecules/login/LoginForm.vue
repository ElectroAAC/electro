<template>
  <v-form
    ref="form"
    v-model="valid"
    class="pl-4 pr-4"
    @submit.prevent="validate"
    @keyup.native.enter="validate"
  >
    <v-text-field
      v-model="name"
      :rules="rules.required"
      label="Username"
      type="text"
      dense
      outlined
      rounded
      required
      validate-on-blur
    />

    <v-text-field
      v-model="password"
      :rules="rules.required"
      label="Password"
      dense
      outlined
      rounded
      required
      hide-details="auto"
      validate-on-blur
      :type="showPassword ? 'text' : 'password'"
      :append-icon="showPassword ? 'mdi-eye' : 'mdi-eye-off'"
      @click:append="showPassword = !showPassword"
    />

    <v-checkbox
      v-model="rememberMe"
      label="Keep me logged in."
      color="success"
      hide-details
    ></v-checkbox>

    <v-btn
      depressed
      class="mt-5 btn btn-success-primary"
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
import { auth } from '@/store'

export default Vue.extend({
  data() {
    return {
      name: '',
      password: '',
      rememberMe: false,
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
    async onLogin(this: any): Promise<void> {
      try {
        const res = await auth.create({
          name: this.name,
          password: this.password,
          rememberMe: this.rememberMe
        })
        if (res === 200) {
          this.$set(this, 'name', "");
          this.$set(this, 'password', "");
          this.$set(this, 'rememberMe', false);

          this.$toast.success(
            'Successfully authenticated',
            {
              keepOnHover: true,
              duration: 2000,
              theme: "bubble",
            }
          )
          this.$router.push('/accounts')
        }
          
        else
          throw new Error("Failed to authentication");
      } catch (error) {
        console.log(error);
        this.$toast.error(
          'Error while authenticating',
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
        await this.onLogin();
    }
  }
})
</script>