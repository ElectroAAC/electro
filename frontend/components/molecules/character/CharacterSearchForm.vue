<template>
  <v-form
    ref="form"
    class="mt-8 text-center"
    v-model="valid"
    @submit.prevent="validate"
  >
    <v-text-field
      v-model="character_name"
      :rules="rules"
      label="Character Name"
      outlined
      dense
      append-icon="mdi-magnify"
      hide-details="auto"
      color="cyan accent-2"
    />
    
    <v-btn
      depressed
      class="btn btn-success-primary mt-4"
      @click="validate"
    >
      Search Character
    </v-btn>
  </v-form>
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
        }
      } catch(err) {

      }
    },

    async validate(this: any) {
      await this.$refs.form.validate();
      if (this.valid)
        this.onSearch();
    }
  }
})
</script>