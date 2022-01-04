<template>
  <v-data-table
    :headers="getHeaders"
    :items="getPlayers"
    :footer-props="footerProps"
    :search="getSearch"
    no-data-text="Nenhum jogador encontrado"
    fixed-header
  >

    <template v-slot:item.vocation="{ item }">
      <div>
        <v-tooltip top>
          <template v-slot:activator="{ on, attrs }">
            <span
              v-bind="attrs"
              v-on="on"
            >
              <CharacterAvatar 
                :avatar="item.vocation" 
                width="50px"
              />
            </span>
          </template>
          <span> {{ item.vocation }} </span>
        </v-tooltip>
      </div>
    </template>

    <template v-slot:item.name="{ item }">
      <div class="d-flex justify-content align-center">
        {{ item.name }}
      </div>
    </template>
  </v-data-table>
</template>

<script lang="ts">
import Vue from 'vue'
import { players } from '~/utils/fakeData'

export default Vue.extend({
  data() {
    return {
      footerProps: {
        "items-per-page-options": [50, 100, 150],
        "items-per-page-all-text": "Todos",
        "items-per-page-text": "Jogadores por Página",
      },
    }
  },

  props: {
    search: {
      type: String,
      required: true
    }
  },

  computed: {
    getSearch(): String {
      return this.search;
    },

    getHeaders(): Object[] {
      return [
        { text: 'Rank', value: 'position' },
        { text: 'Name', value: 'name' },
        { text: 'Vocation', value: 'vocation' },
        { text: 'Level', value: 'level' },
        { text: 'Experience', value: 'experience' },
      ];
    },

    getPlayers(): Object[] {
      return players;
    }
  }
})
</script>