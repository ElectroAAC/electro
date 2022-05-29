<template>
  <v-container>
    <v-tabs
      v-model="tab"
      icons-and-text
      centered
      show-arrows
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

        <div v-else-if="item.text === 'Characters'">
          <v-row>
            <v-col cols="12" class="mt-4 text-center">
              <v-btn text @click="dialog = true" class="header-text">
                <v-icon color="green">
                  mdi-plus
                </v-icon>
                <NuxtLink to="/accounts/create-character"> New Character </NuxtLink>
              </v-btn>

              <v-btn v-if="$changeName.enabled" text @click="dialog = true" class="header-text">
                <v-icon color="orange">
                  mdi-pencil
                </v-icon>
                <NuxtLink to="/accounts/change-name"> Change Name </NuxtLink>
              </v-btn>
              
              <v-btn text @click="dialog = true" class="header-text">
                <v-icon color="red">
                  mdi-delete-outline
                </v-icon>
                <NuxtLink to="/accounts/delete-character"> Delete Character </NuxtLink>
              </v-btn>
            </v-col>
          </v-row>
          
          <CharacterList />
        </div>
      </v-tab-item>
    </v-tabs-items>
  </v-container>
</template>

<script lang="ts">
import Vue from 'vue'
import { account, items } from '@/store'

export default Vue.extend({
  data () {
    return {
      tab: null,
      dialog: false,
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

  computed: {
    $changeName() {
      return account.$changeName;
    }
  },

  mounted() {
    account.getChangeNameStatus();
    if (!items.$items.length) {
      items.getItems('all');
    }
  }
})
</script>