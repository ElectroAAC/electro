<template>
  <v-row class="text-center">
    <v-col cols="6">
      <v-autocomplete
        label="Member"
        :items="$members"
        return-object
        outlined
        dense
        @change="($event) => {
          rankCharacter.character_id = $event.value;
          getRankId($event.rank_level);
          updateRank();
        }"
      ></v-autocomplete>
    </v-col>

    <v-col cols="6">
      <v-autocomplete
        v-model="rankCharacter.rank_level"
        label="Rank"
        :items="getRankGuild"
        return-object
        outlined
        dense
        @change="($event) => {
          rankCharacter.rank_level = $event.value;
          updateRank();
        }"
      ></v-autocomplete>
    </v-col>
  </v-row>
</template>

<script lang="ts">
import Vue from 'vue'
import { guild, manageGuild } from '@/store'
import { rankGuild } from '@/utils/enum'

export default Vue.extend({
  data() {
    return {
      rankCharacter: {
        character_id: undefined,
        rank_level: undefined
      },
      rules: [
        (v: string) => !!v || 'Required field',
      ],
    }
  },

  computed: {
    $guild(): any {
      return guild.$guild;
    },

    $members() {
      return guild.$guild.guild_members.map((member) => ({
        value: member.id,
        text: member.name,
        rank_level: member.level
      }));
    },

    getRankGuild() {
      return rankGuild;
    }
  },

  methods: {
    getRankId(rank_level: any) {
      this.$set(this.rankCharacter, "rank_level", this.getRankGuild.find((rank) => rank.value === rank_level)?.value);
    },

    updateRank(): void {
      manageGuild.setRank(this.rankCharacter);
    }
  }
})
</script>