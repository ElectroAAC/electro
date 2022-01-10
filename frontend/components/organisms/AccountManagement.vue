<template>
  <v-container>
    <v-tabs
      v-model="tab"
      icons-and-text
      centered
    >
      <v-tabs-slider color="primary"></v-tabs-slider>

      <v-tab
        v-for="item in items"
        class="mt-2"
        :key="item.text"
      >
        {{ item.text }}
        <v-icon> {{ item.icon }} </v-icon>
      </v-tab>
    </v-tabs>

    <v-tabs-items v-model="tab" class="mt-5">
      <v-tab-item
        v-for="item in items"
        :key="item.text"
      >
        <AccountInformation 
          v-if="item.text === 'General Information'" 
        />

        <CharacterList 
          v-else-if="item.text === 'Characters'" 
        />
      </v-tab-item>
    </v-tabs-items>
  </v-container>
</template>

<script lang="ts">
import Vue from 'vue'
export default Vue.extend({
  data () {
    return {
      tab: null,
      items: [
        {
          text: 'General Information',
          icon: 'mdi-information-outline'
        },
        {
          text: 'Characters',
          icon: 'mdi-account-cowboy-hat'
        },
        {
          text: 'Logs',
          icon: 'mdi-text-box-outline'
        }
      ]
    }
  },
})
</script>