<template>
  <v-container>
    <CharacterSearchForm v-if="!getCharacterName" />
    
    <div v-else>
      <div v-if="isLoading" class="text-center">
        <v-progress-circular
          indeterminate
          color="primary"
        ></v-progress-circular>
      </div>

      <Character v-else-if="$character" />
    </div>
  </v-container>
</template>

<script lang="ts">
import Vue from 'vue'
import { character } from '@/store'

export default Vue.extend({
  data() {
    return {
      isLoading: false
    }
  },

  computed: {
    getCharacterName(): string | void {
      if (this.$route.params && this.$route.params.name)
        return this.$route.params.name;
    },
    
    $character() {
      return character.$info;
    }
  },
  
  async created() {
    if (this.getCharacterName) {
      await this.getPlayer();
      if (this.$character && this.$character.id) {
        character.getSkill(this.$character.id);
        character.getItems(this.$character.id);
        character.getDeaths(this.$character.id);
      }
    }
  },

  methods: {
    async getPlayer(this: any) {
      try {
        this.$set(this, 'isLoading', true);
        await character.getPlayer(this.getCharacterName);

        if (!this.$character) {
          this.$toast.error(
            'Character Not Found',
            {
              keepOnHover: true,
              duration: 3000,
              theme: "bubble",
              singleton: true,
              position: 'top-right',
            }
          );
          this.$router.push('/character');
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