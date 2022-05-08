<template>
  <div>
    <div v-if="isLoading" class="text-center">
      <Loading style="width: 50% !important;" />
    </div>

    <div v-else> 
      <div 
        class="text-center"
        v-for="(post, idx) in newsList" 
        :key="idx"
      >
        <v-col class="title"> 
          <span> {{ post.title }} </span>
        </v-col>

        <v-col cols="12">
          <span v-html="post.body"></span>
        </v-col>
      </div>
    </div>

    <v-pagination
      v-if="total > 1"
      v-model="page"
      :length="total"
    ></v-pagination>
  </div>
</template>

<script lang="ts">
import Vue from 'vue'
import moment from 'moment'
import { news } from '@/store'

export default Vue.extend({
  data() {
    return {
      page: 1,
      isLoading: true,
      newsData: [],
      options: {},
      total: 0,
    }
  },

  computed: {
    newsList(): { title: String, created_at: number, body: string }[] {
      return this.newsData;
    }
  },

  watch: {
    page(v) {
      this.getLastNews();
    }
  },

  async mounted() {
    await this.getLastNews();
  },

  methods: {
    async getLastNews(this: any): Promise<void> {      
      const response = await news.getLastNews({
        page: this.page,
        limit: 5
      });

      if (response.status === 200) {
        this.$set(this, 'newsData', response.data);
        this.total = response.total;
        this.isLoading = false;
      }

      else {
        this.$set(this, 'newsData', []);
        this.isLoading = false;
      }
    },

    formatDate(date: number): String {
      if (!date || date < 0) {
        return "";
      }
      return moment(date).format("DD.MM.YYYY HH:mm:ss")
    }
  }
})
</script>