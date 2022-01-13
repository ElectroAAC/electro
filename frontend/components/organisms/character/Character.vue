<template>
  <v-row class="mt-2">
    <v-col cols="12" class="text-center"> <h2> Character Informations </h2> </v-col>

    <v-col cols="6" class="pl-6 pr-0">
      <CharacterInfo />
    </v-col>
    
    <v-col cols="6" class="pr-6 pl-0">
      <CharacterItems />
    </v-col>

    <v-col cols="12">
      <CharacterSkills />
    </v-col>
    
    <v-col cols="12">
      <CharacterAchievements />
    </v-col>
    
    <v-col cols="12">
      <CharacterDeaths />
    </v-col>
  </v-row>
</template>

<script lang="ts">
import Vue from 'vue'
import { character } from '@/store'

export default Vue.extend({
  data() {
    return {
      character: ''
    }
  },
  
  computed: {
    getCharacterName(): string | void {
      if (this.$route.params && this.$route.params.name)
        return this.$route.params.name;
    },
    $character() {
      return character.$player;
    }
  },

  mounted() {
    if (this.getCharacterName) {
      console.log(this.getCharacterName)
      this.getPlayer();
    }
  },

  methods: {
    async getPlayer(this: any) {
      try {
        await character.getPlayer(this.getCharacterName);
        if (!this.$character || !this.$character.name) {
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
          // this.$router.push('/character');
          return;
        }
      } catch(err) {
        console.log(err);
      }
    },
  }
})
</script>