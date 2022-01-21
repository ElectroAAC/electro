<template>
  <v-container>
    <div v-if="isLoading" class="text-center">
      <v-progress-circular
        indeterminate
        color="primary"
      ></v-progress-circular>
    </div>

    <div v-else>
      <v-col class="mb-5 text-center" cols="12">
        <v-btn 
          text 
          class="btn btn-success-secondary"
        >
          <NuxtLink to="/guilds/create"> Create Guild </NuxtLink>
        </v-btn>
      </v-col>

      <div  
        v-for="(guild, index) in guildList"
        :key="index"
        class="single-stream-schedule-box not-streaming"
      >
        <span class="date"> LOGO </span>
        <v-row class="ma-0 content text-center">
          <v-col class="text-center" cols="6"> <NuxtLink :to="`/guilds/view/${guild.name}`" class="time"> {{ guild.name }} </NuxtLink> </v-col>
          <v-col class="text-center" cols="12"> <p> {{ guild.description }} </p> </v-col>
        </v-row>
        <span class="date-2"> LOGO </span>
      </div>
    </div>
    
    <v-pagination
      v-model="page"
      :length="total"
    ></v-pagination>
  </v-container>
</template>

<script lang="ts">
import Vue from 'vue'
import { guildList } from '@/store'

export default Vue.extend({
  data () {
    return {
      page: 1,
      isLoading: true,
      guildsData: [],
      total: 1
    }
  },

  computed: {
    guildList(): { name: String, description: String }[] {
      return this.guildsData;
    }
  },

  watch: {
    page(v) {
      this.getGuilds();
    }
  },

  async mounted() {
    await this.getGuilds();
  },

  methods: {
    async getGuilds(this: any): Promise<void> {      
      const response = await guildList.getGuilds({
        page: this.page,
        limit: 10
      });

      if (response.status === 200) {
        this.$set(this, 'guildsData', response.data);
        this.total = response.total;
        this.isLoading = false;
      }

      else {
        this.$set(this, 'guildsData', []);
        this.isLoading = false;
      }
    },
  }
})
</script>

<style lang="scss" scoped>
.single-stream-schedule-box {
  border-radius: 60px;
  position: relative;
  border: 1px solid #00ffb8;
  text-align: center;
  margin-bottom: 30px;
  padding-left: 150px;
  padding-right: 150px;
}

.single-stream-schedule-box.not-streaming .date .date-2{
  text-decoration: line-through;
  color: #00ffb8;
}

.single-stream-schedule-box .date {
  position: absolute;
  left: 35px;
  top: 50%;
  -webkit-transform: translateY(-50%);
  transform: translateY(-50%);
  line-height: 1.2;
  color: var(--mainColor);
  font-weight: 700;
  font-size: 25px;
}

.single-stream-schedule-box .date-2 {
  position: absolute;
  right: 35px;
  top: 50%;
  -webkit-transform: translateY(-50%);
  transform: translateY(-50%);
  line-height: 1.2;
  color: var(--mainColor);
  font-weight: 700;
  font-size: 25px;
}

.single-stream-schedule-box .content {
  background: transparent;
  border: none;
  border-left: 3px solid #00ffb8;
  border-right: 3px solid #00ffb8;
  border-radius: 60px !important;
  padding-top: 25px;
  padding-bottom: 25px;
}

.single-stream-schedule-box.not-streaming .content .time {
  color: #00ffb8
}

.single-stream-schedule-box .content .time {
  display: block;
  text-transform: uppercase;
  text-decoration: none;
  margin-bottom: 8px;
  font-size: 20px;
  font-weight: 600;
}
</style>