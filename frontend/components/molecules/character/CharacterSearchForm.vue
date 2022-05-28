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
    $info(): Object {
      return character.$info;
    }
  },

  methods: {
    async onSearch(this: any) {
      try {
        this.$router.replace('/character/' + this.character_name);
      } catch(err) {
        console.log(err);
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