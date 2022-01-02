<template>
  <img :src="require(`~/assets/images/avatars/${avatar}.png`)">
</template>
<script lang="ts">
export default {
  props: {
    avatar: {
      type: String,
      required: true
    }
  }
}
</script>