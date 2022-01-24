<template>
  <v-container>
    <v-form
      ref="form"
      v-model="valid"
      @submit.prevent="validate"
      @keyup.native.enter="validate"
    >
      <NewsForm />

      <v-col class="mb-5 text-center" cols="12">
        <v-btn 
          text 
          class="btn btn-success-primary"
          rounded
          @click="validate"
        >
          Register New Post
        </v-btn>
        <v-btn 
          text 
          class="btn btn-success-secondary"
          rounded
          @click="back"
        >
          Voltar
        </v-btn>
      </v-col>
    </v-form>
  </v-container>
</template>

<script lang="ts">
import Vue from 'vue'
import { dashboardNews } from '@/store'

export default Vue.extend({
  data() {
    return {
      valid: true,
    }
  },
  
  mounted() {
    dashboardNews.update({
      title: "",
      description: ""
    })
  },

  methods: {
    async onCreate(this: any): Promise<void> {
      const result: { status: Number, message: String} = await dashboardNews.createNewPost(dashboardNews.$post);

      if (result.status === 200) {
        this.$toast.success(
          'Post created successfully',
          {
            keepOnHover: true,
            duration: 2000,
            theme: "bubble",
          }
        )
        this.$router.replace('/dashboard/news');
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
    },

    back() {
      this.$router.replace('/dashboard/news');
    }
  }
})
</script>