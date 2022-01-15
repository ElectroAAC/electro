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
  },
})
</script>