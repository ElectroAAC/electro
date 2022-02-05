<template>
  <v-row class="pl-4 mr-4">
    <v-col :cols="!$vuetify.breakpoint.smAndDown ? '4' : '12'">
      <v-text-field
        v-model="$account.name"
        :rules="rules.required"
        label="Account Name"
        type="text"
        dense
        outlined
        required
        hide-details="auto"
      />
    </v-col>
    
    <v-col :cols="!$vuetify.breakpoint.smAndDown ? '4' : '12'">
      <v-text-field
        v-model="$account.email"
        :rules="rules.email"
        label="E-mail"
        type="email"
        dense
        outlined
        required
        hide-details="auto"
      />
    </v-col>
    
    <v-col :cols="!$vuetify.breakpoint.smAndDown ? '4' : '12'">
      <v-text-field
        v-model="$account.key"
        label="Recovery Key"
        type="text"
        dense
        outlined
        required
        hide-details="auto"
      />
    </v-col>
    
    <v-col :cols="!$vuetify.breakpoint.smAndDown ? '4' : '12'">
      <v-text-field
        v-model="$account.premdays"
        label="Premium Days"
        type="number"
        hide-spin-buttons
        dense
        outlined
        required
        hide-details="auto"
      />
    </v-col>
    
    <v-col :cols="!$vuetify.breakpoint.smAndDown ? '4' : '12'">
      <v-text-field
        v-model="$account.premium_points"
        label="Premium Points"
        type="number"
        hide-spin-buttons
        dense
        outlined
        required
        hide-details="auto"
      />
    </v-col>
    
    <v-col :cols="!$vuetify.breakpoint.smAndDown ? '4' : '12'">
      <v-autocomplete
        v-model="$account.group_id"
        :rules="rules.required"
        :items="getGroupList"
        label="Group Id"
        dense
        outlined
        required
        hide-details="auto"
      />
    </v-col>
  </v-row>
</template>

<script lang="ts">
import Vue from 'vue'
import { dashboardAccounts } from '@/store'
import { accountGroups } from '@/utils/enum'

export default Vue.extend({
  data() {
    return {
      rules: {
        email: [
          (v: string) => !!v || 'Required field',
          (v: string) => /.+@.+\..+/.test(v) || 'Invalid e-mail.',
        ],
        required: [
          (v: string) => !!v || 'Required field',
        ],
      },
    }
  },
  
  computed: {
    $account() {
      return dashboardAccounts.$account;
    },

    getGroupList(): Object[] {
      return accountGroups;
    }
  }
})
</script>