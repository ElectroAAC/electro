<template>
  <v-data-table
    :headers="getHeaders"
    :items="itemsData"
    :footer-props="footerProps"
    :options.sync="options"
    :server-items-length="total"
    :items-per-page="25"
    :loading="isLoadingGrid"
    mobile-breakpoint="0"
    disable-items-per-page
    loading-text="Loading Item List..."
    no-data-text="No page found"
    height="60vh"
  >
    <!-- eslint-disable-next-line vue/valid-v-slot -->
    <template #item.action="{ item }">
      <v-tooltip bottom>
        <template #activator="{ on, attrs }">
          <v-btn
            icon
            v-bind="attrs"
            v-on="on"
            @click="editItem(item.id)"
          >
            <v-icon color="green"> mdi-pencil </v-icon>
          </v-btn>
        </template>
        <span>Edit</span>
      </v-tooltip>
    </template>
  </v-data-table>
</template>

<script lang="ts">
import Vue from 'vue'
import { dashboardShopItem } from '@/store'

export default Vue.extend({
  data() {
    return {
      footerProps: {
        "items-per-page-options": [25, 50, 100, 150],
        "items-per-page-text": "News per page",
      },
      isLoadingGrid: true,
      itemsData: [],
      options: {},
      total: 0,
    }
  },

  computed: {
    getHeaders(): Object[] {
      return [
        { text: 'Name', value: 'name', align: 'center', sortable: false },
        { text: 'Description', value: 'description', align: 'center', sortable: false },
        { text: '', value: 'action', align: 'center', sortable: false },
      ];
    }
  },

  watch: {
    options: {
      handler () {
        this.getItems()
      },
      deep: true,
    },
  },

  methods: {
    async getItems(this: any) {
      this.isLoadingGrid = true;

      const { page, itemsPerPage } = this.options;
      
      const response = await dashboardShopItem.getAll({
        page,
        limit: itemsPerPage
      });

      if (response.status === 200) {
        this.$set(this, 'itemsData', response.data);
        this.total = response.total;
        this.isLoadingGrid = false;
      }

      else {
        this.$set(this, 'itemsData', []);
        this.isLoadingGrid = false;
      }
    },

    editItem(this: any, item: number) {
      this.$router.replace('/dashboard/shop/item/edit/' + item)
    }
  }
})
</script>