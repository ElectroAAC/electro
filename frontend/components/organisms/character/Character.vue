<template>
  <v-row class="mt-2">

    <v-col :cols="$device.isDesktop ? '6' : '12'">
      <CharacterInfo />
    </v-col>
    
    <v-col class="pa-1" cols="6" style="display: grid; align-items: center;">
      <CharacterItems />
    </v-col>

    <v-col class="pa-1" :cols="$device.isDesktop ? '12' : '6'">
      <CharacterSkills />
    </v-col>
    
    <v-col class="pa-1" cols="12">
      <CharacterAchievements />
    </v-col>
    
    <v-col class="pa-1" cols="12">
      <CharacterDeaths />
    </v-col>
  </v-row>
</template>