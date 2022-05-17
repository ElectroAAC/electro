<template>
  <v-row>
    <v-col cols="6">
      <v-autocomplete
        v-model="guild.character_id"
        :rules="required"
        :items="characterList"
        label="Character"
        validate-on-blur
        dense
        outlined
        hide-details="auto"
        @change="($event) => {
          updateGuild()
        }"
      />
    </v-col>

    <v-col cols="6">
      <v-text-field
        v-model="guild.name"
        :rules="required"
        label="Guild Name"
        type="text"
        validate-on-blur
        dense
        outlined
        required
        hide-details="auto"
        @change="($event) => {
          updateGuild()
        }"
      />
    </v-col>

  </v-row>
</template>

<script lang="ts">
import Vue from 'vue'
import { createGuild } from '@/store'

export default Vue.extend({
  data() {
    return {
      guild: {
        name: "",
        character_id: 0
      },
      required: [
        (v: string) => !!v || 'Required field',
      ],
      charactersData: []
    }
  },

  computed: {
    characterList(): Object[] {
      return this.charactersData.map((character: any) => ({
        value: character.id,
        text: character.name
      }))
    }
  },

  async created() {
    await this.getPlayers();
  },

  methods: {
    async getPlayers(this: any): Promise<void> {
      const players: { status: number, characters: Object[] } = await createGuild.getPlayersWithGuild();

      if (players.status === 200)
        this.$set(this, 'charactersData', players.characters);

      else {
        console.log('error');
      }
    },

    updateGuild(): void {
      createGuild.updateGuild(this.guild);
    }
  }
})
</script>