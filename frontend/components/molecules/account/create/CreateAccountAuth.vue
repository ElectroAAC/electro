<template>
  <p class="auth-redirect">
    <span>Already have an account? </span> 
    <button class="text-register" @click="changeStatus()"> 
      Log in 
    </button>
  </p>
</template>

<script lang="ts">
import Vue from 'vue'
import { accountRegister } from '@/store'

export default Vue.extend({
  methods: {
    changeStatus(): void {
      accountRegister.changeRegistering(false);
    }
  }
})
</script>