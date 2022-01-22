<template>
  <div class="container text-center">
    <DownloadLink 
      :link="linkDownload.link"
      :title="linkDownload.title"
      class="mt-2"
    />

    <DownloadLink 
      v-if="isExistsSecondLink"
      :link="secondLink.link"
      :title="secondLink.title" 
      class="mt-2"
    />
  </div>
</template>

<script lang="ts">
import Vue from 'vue'
export default Vue.extend({
  computed: {
    linkDownload() {
      return {
        link: process.env.DOWNLOAD_LINK,
        title: process.env.DOWNLOAD_TITLE
      }
    },

    isExistsSecondLink() {;
      return process.env.OPTION_SECOND_LINK === "true";
    },

    secondLink() {
      return {
        link: process.env.SECOND_LINK,
        title: process.env.SECOND_DOWNLOAD_TITLE
      };
    }
  }
})
</script>