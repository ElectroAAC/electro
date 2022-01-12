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
          v-model="name"
          :rules="required"
          label="Character Name"
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
          v-model="sex"
          :rules="required"
          label="Sex"
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
          v-model="vocation"
          :rules="required"
          label="Vocation"
          type="text"
          dense
          outlined
          rounded
          required
          hide-details="auto"
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

export default Vue.extend({
  data() {
    return {
      name: '',
      sex: '',
      vocation: 0,
      valid: true,
      required: [
        (v: string) => !!v || 'Required field',
      ],
    }
  },

  methods: {
    async validate(this: any): Promise<void> {
      await this.$refs.form.validate();
    }
  }
})
</script>