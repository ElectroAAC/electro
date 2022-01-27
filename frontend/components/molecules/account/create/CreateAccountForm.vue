<template>
  <v-form
    ref="form"
    v-model="valid"
    @submit.prevent="validate"
    @keyup.native.enter="validate"
  >
    <v-row class="pl-4 mr-4">

      <v-col cols="12">
        <v-text-field
          v-model="email"
          :rules="rules.email"
          label="E-mail"
          type="email"
          dense
          outlined
          rounded
          required
          hide-details="auto"
        />
      </v-col>

      <v-col cols="6">
        <v-text-field
          v-model="name"
          :rules="rules.required"
          label="Username"
          type="text"
          dense
          outlined
          rounded
          required
          hide-details="auto"
        />
      </v-col>

      <v-col cols="6">
        <v-text-field
          v-model="password"
          :rules="rules.required"
          label="Password"
          dense
          outlined
          rounded
          required
          hide-details="auto"
          :type="showPassword ? 'text' : 'password'"
          :append-icon="showPassword ? 'mdi-eye' : 'mdi-eye-off'"
          @click:append="showPassword = !showPassword"
        />
      </v-col>

      <v-col cols="12">
        <v-btn
          depressed
          class="mt-5 btn btn-success-primary"
          width="100%"
          rounded
          @click="validate"
        >
          Create Account
        </v-btn>
      </v-col>

    </v-row>
  </v-form>
</template>

<script lang="ts">
import Vue from 'vue'
import { accountRegister } from '@/store'

export default Vue.extend({
  data() {
    return {
      email: '',
      name: '',
      password: '',
      rememberMe: false,
      valid: true,
      showPassword: false,
      rules: {
        email: [
          (v: string) => !!v || 'Required field',
          (v: string) => /.+@.+\..+/.test(v) || 'Invalid e-mail.',
        ],
        required: [
          (v: string) => !!v || 'Required field',
        ],
      },
    }
  },

  methods: {
    async onSubmit(this: any): Promise<void> {
      try {
        const res = await accountRegister.create({
          email: this.email,
          name: this.name,
          password: this.password
        })

        if (res === 200) {
          this.$set(this, 'email', "");
          this.$set(this, 'name', "");
          this.$set(this, 'password', "");

          this.$toast.success(
            'Successfully created',
            {
              keepOnHover: true,
              duration: 2000,
              theme: "bubble",
            }
          )
          accountRegister.changeRegistering(false)
          this.$router.push('/accounts')
        }
          
        else
          throw new Error("Failed to create account");
      } catch (error) {
        this.$toast.error(
          'Error while create account',
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
        await this.onSubmit();
    }
  }
})
</script>