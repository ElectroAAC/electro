<template>
  <v-data-table
    :headers="getHeaders"
    :items="newsData"
    :footer-props="footerProps"
    :options.sync="options"
    :server-items-length="total"
    :items-per-page="25"
    :loading="isLoadingGrid"
    disable-items-per-page
    loading-text="Loading Page List..."
    no-data-text="No page found"
    height="60vh"
  >
    <template #item.action="{ item }">
      <v-tooltip bottom>
        <template #activator="{ on, attrs }">
          <v-btn
            icon
            v-bind="attrs"
            v-on="on"
            @click="editNew(item.id)"
          >
            <v-icon color="green"> mdi-pencil </v-icon>
          </v-btn>
        </template>
        <span>Edit</span>
      </v-tooltip>

      <v-tooltip bottom>
        <template #activator="{ on, attrs }">
          <v-btn
            icon
            v-bind="attrs"
            v-on="on"
          >
            <v-icon color="red"> mdi-delete-outline </v-icon>
          </v-btn>
        </template>
        <span>Delete</span>
      </v-tooltip>
    </template>
  </v-data-table>
</template>

<script lang="ts">
import Vue from 'vue'
import { news } from '@/store'

export default Vue.extend({
  data() {
    return {
      footerProps: {
        "items-per-page-options": [25, 50, 100, 150],
        "items-per-page-text": "News per page",
      },
      isLoadingGrid: true,
      newsData: [],
      options: {},
      total: 0,
    }
  },

  computed: {
    getHeaders(): Object[] {
      return [
        { text: 'Title', value: 'title', align: 'center', sortable: false },
        { text: '', value: 'action', align: 'center', sortable: false },
      ];
    }
  },

  watch: {
    options: {
      handler () {
        this.getNews()
      },
      deep: true,
    },
  },

  methods: {
    async getNews(this: any) {
      this.isLoadingGrid = true;

      const { page, itemsPerPage } = this.options;
      
      const response = await news.getLastNews({
        page,
        limit: itemsPerPage
      });

      if (response.status === 200) {
        this.$set(this, 'newsData', response.data);
        this.total = response.total;
        this.isLoadingGrid = false;
      }

      else {
        this.$set(this, 'newsData', []);
        this.isLoadingGrid = false;
      }
    },

    editNew(this: any, item: number) {
      this.$router.replace('/dashboard/news/edit/', item)
    }
  }
})
</script>