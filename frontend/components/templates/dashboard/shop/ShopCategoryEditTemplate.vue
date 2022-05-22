<template>
  <v-container class="dashboard-container">
    <div v-if="isLoading" class="text-center">
      <Loading  style="width: 50% !important;" />
    </div>

    <ValueNoExists 
      v-else-if="categoryInvalid"
      text="Category not found"
      to="/dashboard/shop/categories"
    />

    <ShopCategoryEdit 
      v-else
    />
  </v-container>
</template>

<script lang="ts">
import Vue from 'vue'
import { dashboardShopCategory } from '@/store'

export default Vue.extend({
  data() {
    return {
      isLoading: false,
      categoryInvalid: false
    }
  },

  computed: {
    getCategory(): number {
      if (this.$route.params && this.$route.params.id)
        return parseInt(this.$route.params.id);
      return 0;
    },
  },

  async mounted() {
    await this.categoryExists();
  },

  methods: {
    async categoryExists(): Promise<void> {
      this.$set(this, 'isLoading', true);

      const category = await dashboardShopCategory.find(this.getCategory);

      if (category.status !== 200) {
        this.$set(this, 'categoryInvalid', true);
      }
      else {
        this.$set(this, 'categoryInvalid', false)
      }
      this.$set(this, 'isLoading', false);
    },
  }
})
</script>