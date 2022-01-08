<template>
  <v-dialog
    v-model="$_dialog"
    width="850"
  >
    <div cols="9" class="d-flex auth-box pa-0">
      <LoginWelcome width="450px"/>
      
      <div class="d-flex align-content-center justify-center flex-wrap">
        <LoginHeader />

        <LoginForm />

        <LoginAuth />
      </div>
    </div>
  </v-dialog>
</template>

<script lang="ts">
import Vue from 'vue'
export default Vue.extend({
  props: {
    dialog: {
      type: Boolean,
      required: true
    }
  },

  computed: {
    $_dialog: {
      get(this: any): boolean {
        return this.dialog;
      },
      set(val): void {
        this.$emit('update-dialog', val);
      }
    },
  },
})
</script>