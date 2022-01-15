<template>
  <v-dialog
    v-model="$_dialog"
    width="850"
  >
    <div cols="9" class="d-flex auth-box pa-0">
      <CreateCharacterImage width="450px" class="auth-image"/>
      
      <div class="d-flex align-content-center justify-center flex-wrap">
        <HeaderDialog 
          small_text="Please choose name, sex and vocation to"
          big_text="Create your character"
        />

        <CreateCharacterForm />
        
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

<style lang="scss" scoped>
.auth-box {
  background: rgb(25 46 72 / 87%) !important
}
</style>