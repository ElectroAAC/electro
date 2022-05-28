<template>
  <v-row class="mt-2">

    <v-col class="pa-2" :cols="!$vuetify.breakpoint.mdAndDown ? '6' : '12'">
      <CharacterInfo />
    </v-col>
    
    <v-col class="pa-2" :cols="!$vuetify.breakpoint.mdAndDown ? '6' : '12'">
      <CharacterItems />
    </v-col>

    <v-col class="pa-2" cols="12">
      <CharacterSkills />
    </v-col>
    
    <v-col class="pa-2" cols="12">
      <CharacterAchievements />
    </v-col>
    
    <v-col class="pa-2" cols="12">
      <CharacterDeaths />
    </v-col>
  </v-row>
</template>