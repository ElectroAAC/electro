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
      
        <v-col v-if="getTypeCharacterDefault" cols="12">
          <CharacterSelectDefault />
        </v-col>
      
        <v-col v-else-if="getTypeCharacterCustom" cols="12">
          <CharacterSelectCustom />
        </v-col>
        
        <v-col class="text-center" cols="12">
          <v-btn
            depressed
            class="mt-5 btn btn-success-primary"
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
import { createCharacter } from '@/store'

export default Vue.extend({
  data() {
    return {
      valid: true,
    }
  },

  computed: {
    getTypeCharacterDefault() {
      return process.env.CREATE_CHARACTER_DEFAULT;
    },
    getTypeCharacterCustom() {
      return process.env.CREATE_CHARACTER_CUSTOM;
    },
    getTypeCharacterCustomSex() {
      return process.env.CREATE_CHARACTER_CUSTOM_SEX;
    },
  },

  methods: {
    async onCreate(this: any): Promise<void> {
      const result: { status: Number, message: String} = await createCharacter.create(createCharacter.$character);

      if (result.status === 200) {
        this.$toast.success(
          'Successfully created',
          {
            keepOnHover: true,
            duration: 2000,
            theme: "bubble",
          }
        )
        this.$router.replace('/accounts');
      }
        
      else {
        this.$toast.error(
          result.message,
          {
            keepOnHover: true,
            duration: 2000,
            theme: "bubble",
          }
        )
      }
    },

    async validate(this: any): Promise<void> {
      await this.$refs.form.validate();

      if (this.valid)
        await this.onCreate();
    }
  }
})
</script>