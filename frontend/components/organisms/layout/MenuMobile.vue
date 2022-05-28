<template>
  <v-navigation-drawer
    v-model="$_drawer"
    :mini-variant="miniVariant"
    :clipped="false"
    absolute
    app
    class="menu-mobile text-center"
  >      
    <MenuMobileOptions :miniVariant="miniVariant"/>
  </v-navigation-drawer>
</template>

<script lang="ts">
import Vue from 'vue'
export default Vue.extend({
  props: {
    drawer: {
      type: Boolean,
      default: false
    },
    miniVariant: {
      type: Boolean,
      default: false
    }
  },

  computed: {
    $_drawer: {
      get(this: any): boolean {
        return this.drawer;
      },
      set(val): void {
        this.$emit('update-drawer', val);
      }
    },
  }
})
</script>

<style lang="scss" scoped>
.theme--light.v-list {
  background: inherit !important;
}
</style>