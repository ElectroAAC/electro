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
          To change the character's name, it costs: {{ $changeName.points }} premium points. 
          <br> You have: {{ $account.premium_points }} premium points.
        </v-col>

        <v-col cols="12">
          <ChangeNameForm />
        </v-col>

        <v-col cols="12">
          <v-btn
            depressed
            class="mt-5 btn btn-success-primary"
            width="100%"
            rounded
            @click="validate"
          >
            Change Name
          </v-btn>
        </v-col>
      </v-row>
    </v-form>
  </v-container>
</template>

<script lang="ts">
import Vue from 'vue'
import { account } from '@/store'

export default Vue.extend({
  data() {
    return {
      valid: true,
    }
  },

  computed: {
    $account() {
      return account.$account;
    },

    $changeName() {
      return account.$changeName;
    }
  },
  
  methods: {
    async validate(this: any): Promise<void> {
      await this.$refs.form.validate();
    }
  }
})
</script>