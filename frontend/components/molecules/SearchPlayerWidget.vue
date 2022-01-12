<template>
  <aside class="widget">
    <h5 class="widget-title"> Search </h5>
    <v-container>
      
    <v-form
      ref="form"
      v-model="valid"
      @submit.prevent="validate"
    >
      <v-text-field
        v-model="character_name"
        label="Search Player"
        single-line
        outlined
        dense
        append-icon="mdi-magnify"
        hide-details="auto"
        background-color="rgb(3 255 243 / 45%)"
        color="cyan accent-2"
      />
    </v-form>
    </v-container>
  </aside>
</template>

<script lang="ts">
import Vue from 'vue'
import { character } from '@/store'

export default Vue.extend({
  data() {
    return {
      valid: true,
      character_name: "",
      rules: [
        (v: string) => !!v || 'Required field',
      ],
    }
  },

  computed: {
    $player(): Object {
      return character.$player;
    }
  },

  methods: {
    async onSearch(this: any) {
      try {
        await character.getPlayer(this.character_name);
        if (!this.$player || !this.$player.name) {
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
          return;
        }
        else {
          this.$router.push('/character/' + this.character_name);
          this.$set(this, 'character_name', "");
        }
      } catch(err) {

      }
    },

    async validate(this: any) {
      if (this.character_name === "" || !this.character_name) {
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
        return;
      }
      this.onSearch();
    }
  }
})
</script>