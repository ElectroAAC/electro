<template>
  <div>
    <div v-if="isLoading" class="text-center">
      <v-progress-circular
        indeterminate
        color="primary"
      ></v-progress-circular>
    </div>

    <ValueNoExists 
      v-else-if="newsInvalid"
      text="NewsPage not found"
      to="/dashboard/news"
    />

    <NewsEdit 
      v-else
    />
  </div>
</template>

<script lang="ts">
import Vue from 'vue'
import { dashboardNews } from '@/store'

export default Vue.extend({
  data() {
    return {
      isLoading: false,
      newsInvalid: false
    }
  },

  computed: {
    getPage(): number {
      if (this.$route.params && this.$route.params.id)
        return parseInt(this.$route.params.id);
      return 0;
    },
  },

  async mounted() {
    await this.pageExists();
  },

  methods: {
    async pageExists(): Promise<void> {
      this.$set(this, 'isLoading', true);
      const news = await dashboardNews.findPost(this.getPage);

      if (news.status !== 200) {
        this.$set(this, 'newsInvalid', true);
      }
      else {
        this.$set(this, 'newsInvalid', false)
      }
      this.$set(this, 'isLoading', false);
    },
  }
})
</script>