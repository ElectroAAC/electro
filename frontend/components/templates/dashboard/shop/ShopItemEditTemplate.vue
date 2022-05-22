<template>
  <v-container class="dashboard-container">
    <div v-if="isLoading" class="text-center">
      <Loading  style="width: 50% !important;" />
    </div>

    <ValueNoExists 
      v-else-if="itemInvalid"
      text="Item not found"
      to="/dashboard/shop/items"
    />

    <ShopItemEdit 
      v-else
    />
  </v-container>
</template>

<script lang="ts">
import Vue from 'vue'
import { dashboardShopItem } from '@/store'

export default Vue.extend({
  data() {
    return {
      isLoading: false,
      itemInvalid: false
    }
  },

  computed: {
    getItem(): number {
      if (this.$route.params && this.$route.params.id)
        return parseInt(this.$route.params.id);
      return 0;
    },
  },

  async mounted() {
    await this.itemExists();
  },

  methods: {
    async itemExists(): Promise<void> {
      this.$set(this, 'isLoading', true);

      const item = await dashboardShopItem.find(this.getItem);

      if (item.status !== 200) {
        this.$set(this, 'itemInvalid', true);
      }
      else {
        this.$set(this, 'itemInvalid', false)
      }
      this.$set(this, 'isLoading', false);
    },
  }
})
</script>