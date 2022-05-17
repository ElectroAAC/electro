<template>
  <aside class="widget">
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
        color="var(--main-color)"
        @click:append="onSearch"
      />
    </v-form>
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
    $info(): Object {
      return character.$info;
    }
  },

  methods: {
    async onSearch(this: any) {
      try {
        this.$router.push('/character/' + this.character_name);
        this.$set(this, 'character_name', "");
      } catch(err) {
        console.log(err);
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