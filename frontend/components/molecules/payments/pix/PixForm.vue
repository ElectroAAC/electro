<template>
  <v-text-field
    v-model="value"
    :rules="required"
    label="Value"
    type="number"
    validate-on-blur
    dense
    outlined
    required
    hide-details="auto"
    @change="($event) => {
      setValue($event);
    }"
  />
</template>

<script lang="ts">
import Vue from 'vue'
import { pixPayment } from '@/store'

export default Vue.extend({
  data() {
    return {
      value: '',
      required: [
        (v: string) => !!v || 'Required field',
      ],
    }
  },

  methods: {
    setValue(this: any, value: string): void {
      pixPayment.setValue(value);
    }
  }
})
</script>