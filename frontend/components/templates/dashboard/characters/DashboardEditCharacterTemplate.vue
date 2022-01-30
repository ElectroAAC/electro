<template>
  <div>
    <div v-if="isLoading" class="text-center">
      <v-progress-circular
        indeterminate
        color="primary"
      ></v-progress-circular>
    </div>

    <ValueNoExists 
      v-else-if="characterInvalid"
      text="Character not found"
      to="/dashboard/characters"
    />

    <DashboardEditCharacter
      v-else
    />
  </div>
</template>

<script lang="ts">
import Vue from 'vue'
import { dashboardCharacters } from '@/store'

export default Vue.extend({
  data() {
    return {
      isLoading: true,
      characterInvalid: false
    }
  },

  computed: {
    getCharacterName(): string {
      if (this.$route.params && this.$route.params.name)
        return this.$route.params.name;
      return "";
    }
  },

  async mounted() {
    await this.characterExists();
  },

  methods: {
    async characterExists(): Promise<void> {
      this.$set(this, 'isLoading', true);

      const response = await dashboardCharacters.find(this.getCharacterName);

      if (!response || !response.data || !response.data.name) {
        this.$set(this, 'characterInvalid', true);
      }

      else {
        this.$set(this, 'characterInvalid', false);
      }

      this.$set(this, 'isLoading', false);
    },
  }
})
</script>
