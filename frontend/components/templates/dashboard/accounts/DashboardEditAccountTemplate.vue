<template>
  <div>
    <div v-if="isLoading" class="text-center">
      <v-progress-circular
        indeterminate
        color="primary"
      ></v-progress-circular>
    </div>

    <ValueNoExists 
      v-else-if="accountInvalid"
      text="Account not found"
      to="/dashboard/accounts"
    />

    <DashboardEditAccount
      v-else
    />
  </div>
</template>

<script lang="ts">
import Vue from 'vue'
import { dashboardAccounts } from '@/store'

export default Vue.extend({
  data() {
    return {
      isLoading: true,
      accountInvalid: false
    }
  },

  computed: {
    getAccountName(): string {
      if (this.$route.params && this.$route.params.name)
        return this.$route.params.name;
      return "";
    }
  },

  async mounted() {
    await this.accountExists();
  },

  methods: {
    async accountExists(): Promise<void> {
      this.$set(this, 'isLoading', true);

      const response = await dashboardAccounts.find(this.getAccountName);
      
      if (!response || !response.data.length) {
        this.$set(this, 'accountInvalid', true);
      }

      else {
        this.$set(this, 'accountInvalid', false);
      }

      this.$set(this, 'isLoading', false);
    },
  }
})
</script>
