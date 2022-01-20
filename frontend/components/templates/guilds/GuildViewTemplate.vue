<template>
  <div>
    <Title text="View Guild"/>
    <v-container>
      <div v-if="isLoading" class="text-center">
        <v-progress-circular
          indeterminate
          color="primary"
        ></v-progress-circular>
      </div>
      
      <GuildView v-else />
    </v-container>
  </div>
</template>

<script lang="ts">
import Vue from 'vue'
import { guild } from '@/store'

export default Vue.extend({
  data() {
    return {
      isLoading: true
    }
  },

  computed: {
    getGuildName(): string | void {
      if (this.$route.params && this.$route.params.name)
        return this.$route.params.name;
    },

    $guild() {
      return guild.$guild;
    }
  },
  
  async created(this: any) {
    this.getGuild();
  },

  methods: {
    async getGuild(this: any) {
      try {
        this.$set(this, 'isLoading', true);

        const res = await guild.getGuild(this.getGuildName);

        if (res !== 200) {
          this.$toast.error('Guild Not Found');

          this.$router.replace('/guilds');

          return;
        }

        this.$set(this, 'isLoading', false);
      } catch(err) {
        console.log(err);
      }
    },
  }
})
</script>