<template>
  <v-container>
    <div v-if="isLoading" class="text-center">
      <Loading  style="width: 50% !important;" />
    </div>

    <div v-else-if="!deathsData.length" class="text-center">
      No deaths recorded.
    </div>

    <div v-else> 
      <v-row 
        v-for="(death, idx) in deathList" 
        :key="idx"
      >
        <v-col class="pl-0" cols="3"> {{ formatDate(death.time) }} </v-col>
        <v-col class="text-center" cols="9" v-html="death.killers_string">
        </v-col>
      </v-row>

      <v-pagination
        v-model="page"
        circle
        :length="total"
      ></v-pagination>
    </div>
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
    deathList(): { time: number, killers_string: string }[] {
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