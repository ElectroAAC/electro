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