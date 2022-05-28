<template>
  <div>
    <Title text="Characters"/>
    
    <v-container class="main-content">
      <CharacterSearchForm v-if="!getCharacterName" />
      
      <div v-else>
        <div v-if="isLoading" class="text-center">
          <Loading  style="width: 50% !important;" />
        </div>

        <Character v-else-if="$character" />
      </div>
    </v-container>
  </div>
</template>

<script lang="ts">
import Vue from 'vue'
import { 
  character,
  death,
  items,
  skill,
  storage 
} from '@/store'

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
        const promises = [
          items.getItems(this.$character.id),
          death.getDeaths(this.$character.id),
          skill.getSkills(this.$character.id),
          storage.getStorages(this.$character.id)
        ];

        await Promise.all(promises);
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
          this.$router.replace('/character');
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