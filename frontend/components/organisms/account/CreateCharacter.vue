<template>
  <v-container>
    <v-form
      ref="form"
      v-model="valid"
      @submit.prevent="validate"
      @keyup.native.enter="validate"
    >
      <v-row>
        <v-col cols="12">
          <CreateCharacterForm />
        </v-col>
      
        <v-col cols="12">
          <CharacterSelectVocation />
        </v-col>
        
        <v-col cols="12">
          <v-btn
            depressed
            class="mt-5 btn btn-success-primary"
            width="100%"
            rounded
            @click="validate"
          >
            Create Character
          </v-btn>
        </v-col>
      </v-row>
    </v-form>
  </v-container>
</template>

<script lang="ts">
import Vue from 'vue'
export default Vue.extend({
  data() {
    return {
      valid: true,
    }
  },

  methods: {
    async validate(this: any): Promise<void> {
      await this.$refs.form.validate();
    }
  }
})
</script>