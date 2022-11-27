<template>
  <div>
    <Title text="Payment"/>

    <v-container>
      <v-autocomplete
        v-model="method_selected"
        :rules="required"
        :items="getAllMethods"
        label="Method Payment"
        validate-on-blur
        dense
        outlined
        hide-details="auto"
      />

      <Pix v-if="pixIsActive && method_selected === 1" class="main-content"/>
    </v-container>
  </div>
</template>

<script lang="ts">
import Vue from 'vue'
import { shop } from '@/store'
import { methods_payments } from '@/utils/enum'

export default Vue.extend({
  data() {
    return {
      method_selected: undefined,
      required: [
        (v: string) => !!v || 'Required field',
      ],
    }
  },

  computed: {
    pixIsActive: (): Boolean => shop.$payments.pix,
    getAllMethods: (): Array<Object> => methods_payments
  },
})
</script>