<template>
  <v-container class="dashboard-container" style="height: 100%;">
    <v-row class="pa-0 text-center">
      <v-col cols="12"> <h2> Top Vocations </h2> </v-col>
      <div class="mt-10">
        <Doughnutchart
          ref="skills_chart" 
          :chart-data="chartData"
          :options="options"
        />
      </div>
    </v-row>
  </v-container>
</template>

<script lang="ts">
import Vue from 'vue'
import randomColor from 'randomcolor';
import { dashboardHome } from '@/store'

const options = {
  responsive: true, 
  maintainAspectRatio: false, 
  animation: {
    animateRotate: false
  }
}

export default Vue.extend({
  data() {
    return {
      options,
      chartData: {
        labels: [],
        datasets: [
          {
            backgroundColor: [],
            data: []
          }
        ]
      }
    }
  },
  
  computed: {
    getTotalVocations() {
      return dashboardHome.$vocations;
    }
  },

  mounted(this: any) {
    this.updateChart();
    this.$refs.skills_chart.update();
    console.log(this.chartData);
  },

  methods: {
    updateChart(this: any) {
      this.getTotalVocations.map((vocation: { vocation_name: any; total: any; }) => {
        this.chartData.labels.push(vocation ? vocation.vocation_name : "");
        this.chartData.datasets[0].backgroundColor.push(randomColor());
        this.chartData.datasets[0].data.push(vocation.total);
      })
    }
  }
})
</script>