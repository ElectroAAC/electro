<template>
  <div class="auth-redirect">
    <span>Don't have an account yet?</span> 
    <button class="text-register" @click="changeStatus()"> 
      Register 
    </button>
  </div>
</template>

<script lang="ts">
import Vue from 'vue'
import { accountRegister } from '@/store'

export default Vue.extend({
  methods: {
    changeStatus(): void {
      accountRegister.changeRegistering(true);
    }
  }
})
</script>