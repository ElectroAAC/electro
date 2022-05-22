<template>
  <v-dialog 
    v-model="$dialog" 
    max-width="600px"
    @click:outside="actionConfirm()"
  >
    <v-card class="auth-box modal-delete text-center">
      <v-card-title class="text-h5">
        <v-row>
          <v-col class="text-left" cols="10">
            {{ title }}
          </v-col>
          <v-col cols="2" class="d-flex justify-end" @click="actionConfirm()">
            <v-btn icon color="gray">
              <v-icon color="white" v-bind="attrs" v-on="on">
                mdi-close
              </v-icon>
            </v-btn>
          </v-col>
        </v-row>
      </v-card-title>

      <v-divider color="white"></v-divider>

      <!-- eslint-disable-next-line vue/no-v-html -->
      <p class="pt-5" v-html="text"></p>

      <v-card-actions>
        <v-spacer></v-spacer>
          <v-btn class="btn btn-danger-secondary" text @click="actionConfirm(true)">
            {{ btn_text_action }}
          </v-btn>
          <v-btn class="btn btn-success-secondary" text @click="actionConfirm()">
            Cancel
          </v-btn>
        <v-spacer></v-spacer>
      </v-card-actions>
    </v-card>
  </v-dialog>
</template>

<script lang="ts">
import Vue from 'vue'
export default Vue.extend({

  props: {
    title: {
      type: String,
      required: true
    },
    text: {
      type: String,
      required: true
    },
    // eslint-disable-next-line vue/prop-name-casing
    btn_text_action: {
      type: String,
      required: true
    },
    dialog: {
      type: Boolean,
      required: true
    }
  },
  
  data() {
    return {
      attrs: null,
      on: null,
    }
  },

  computed: {
    $dialog(): boolean {
      return this.dialog;
    }
  },

  methods: {
    actionConfirm(action = false): void {
      this.$emit('action-confirm', false, action);
    }
  }
})
</script>

<style lang="scss" scoped>
.auth-box {
  background: var(--bg-header) !important;
  box-shadow: 0px 3px 1px -2px rgb(0 0 0 / 20%), 0px 2px 2px 0px rgb(0 0 0 / 14%), 0px 1px 5px 0px rgb(0 0 0 / 12%) !important;
  padding: 0;
}
</style>