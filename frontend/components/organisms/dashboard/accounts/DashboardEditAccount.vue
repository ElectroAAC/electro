<template>
  <v-container class="dashboard-container">
    <v-form 
      class="text-center"
      ref="form"
      v-model="valid"
      @submit.prevent="validate"
      @keyup.native.enter="validate"
    >
      <h3> Edit Account </h3>

      <v-col cols="12">
        <DashboardAccountForm class="pa-5"/>
      </v-col>
      
      <v-col class="text-center" cols="12">
        <v-btn
          class="mt-5 btn btn-success-secondary"
          text
          rounded
          @click="validate"
        >
          Update Account
        </v-btn>
        
        <v-btn
          class="mt-5 btn btn-danger-secondary"
          text
          rounded
          @click="back()"
        >
          Back
        </v-btn>
      </v-col>
    </v-form>
  </v-container>
</template>

<script lang="ts">
import Vue from 'vue'
import { dashboardAccounts } from '@/store'

export default Vue.extend({
  data() {
    return {
      valid: true,
    }
  },
  methods: {
    back(): void {
      this.$router.replace('/dashboard/accounts');
    },

    async onSubmit(this: any): Promise<void> {
      try {
        const res = await dashboardAccounts.update(dashboardAccounts.$account)
        console.log(res);
        if (res.status === 200) {
          this.$toast.success(
            'Successfully updated',
            {
              keepOnHover: true,
              duration: 2000,
              theme: "bubble",
            }
          )
          this.back();
        }
          
        else
          throw new Error("Failed to update account");
      } catch (error) {
        this.$toast.error(
          'Error while update account',
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