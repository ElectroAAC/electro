<template>
  <v-container>
    <div v-if="isLoading" class="text-center">
      <v-progress-circular
        indeterminate
        color="primary"
      ></v-progress-circular>
    </div>

    <div v-else> 
      <v-row 
        v-for="(death, idx) in deathList" 
        :key="idx"
      >
        <v-col cols="3"> {{ formatDate(death.time) }} </v-col>
        <v-col cols="9">
          <span v-html="death.killers_string"></span>
        </v-col>
      </v-row>
    </div>

    <v-pagination
      v-model="page"
      :length="total"
    ></v-pagination>
  </v-container>
</template>

<script lang="ts">
import Vue from 'vue'
import moment from 'moment'
import { lastkills } from '@/store'

export default Vue.extend({
  data() {
    return {
      page: 1,
      isLoading: true,
      deathsData: [],
      options: {},
      total: 0,
    }
  },

  computed: {
    deathList(): { name: String, description: String }[] {
      return this.deathsData;
    }
  },

  watch: {
    page(v) {
      this.getLastkills();
    }
  },

  async mounted() {
    await this.getLastkills();
  },

  methods: {
    async getLastkills(this: any): Promise<void> {      
      const response = await lastkills.getLastkills({
        page: this.page,
        limit: 20
      });

      if (response.status === 200) {
        this.$set(this, 'deathsData', response.data);
        this.total = response.total;
        this.isLoading = false;
      }

      else {
        this.$set(this, 'deathsData', []);
        this.isLoading = false;
      }
    },

    formatDate(date: number): String {
      if (!date || date < 0) {
        return "";
      }
      return moment(date*1000).format("DD.MM.YYYY HH:mm:ss")
    }
  }
})
</script>