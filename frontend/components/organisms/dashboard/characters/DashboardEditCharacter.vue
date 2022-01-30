<template>
  <v-container>
    <v-form 
      class="text-center"
      ref="form"
      v-model="valid"
      @submit.prevent="validate"
      @keyup.native.enter="validate"
      >
      <v-tabs
        v-model="tab"
        icons-and-text
        centered
      >
        <v-tabs-slider></v-tabs-slider>

        <v-tab
          v-for="item in items"
          class="mt-2"
          :key="item.text"
        >
          {{ item.text }}
          <v-icon> {{ item.icon }} </v-icon>
        </v-tab>
      </v-tabs>

      <v-tabs-items v-model="tab" class="mt-5">
        <v-tab-item
          v-for="item in items"
          :key="item.text"
        >
          <DashboardCharacterForm v-if="item.text === 'Player'" />
          <div v-else-if="item.text === 'Characteristics'">
            Characteristics
          </div>
          <div v-else-if="item.text === 'Skills'">
            Skills
          </div>
          <div v-else-if="item.text === 'Outfit'">
            Outfit
          </div>
        </v-tab-item>
      </v-tabs-items>
      
      <v-col class="text-center" cols="12">
        <v-btn
          class="mt-5 btn btn-success-secondary"
          text
          rounded
          @click="validate"
        >
          Update Account
        </v-btn>
            
        <v-btn
          class="mt-5 btn btn-danger-secondary"
          text
          rounded
          @click="back()"
        >
          Back
        </v-btn>
      </v-col>
    </v-form>
  </v-container>
</template>

<script lang="ts">
import Vue from 'vue'
import { dashboardCharacters } from '@/store'
export default Vue.extend({
  data() {
    return {
      valid: true,
      tab: null,
      items: [
        {
          text: 'Player',
          icon: 'mdi-cog'
        },
        {
          text: 'Characteristics',
          icon: 'mdi-heart'
        },
        {
          text: 'Skills',
          icon: 'mdi-knife-military'
        },
        {
          text: 'Outfit',
          icon: 'mdi-drama-masks'
        }
      ]
    }
  },
  
  methods: {
    back(): void {
      this.$router.replace('/dashboard/characters');
    },

    async onSubmit(this: any): Promise<void> {
      try {
        const res = await dashboardCharacters.update(dashboardCharacters.$character)
        
        if (res.status === 200) {
          this.$toast.success(
            'Successfully updated',
            {
              keepOnHover: true,
              duration: 2000,
              theme: "bubble",
            }
          )
          this.back();
        }
          
        else
          throw new Error("Failed to update account");
      } catch (error) {
        this.$toast.error(
          'Error while update account',
          {
            keepOnHover: true,
            duration: 2000,
            theme: "bubble",
          }
        )
      }
    },

    async validate(this: any): Promise<void> {
      await this.$refs.form.validate();
      if (this.valid)
        await this.onSubmit();
    }
  }
})
</script>