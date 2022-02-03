<template>
  <v-row class="pa-10">
    <v-col 
      v-for="(skill, idx) in $skills"
      :key="idx"
      :cols="!$vuetify.breakpoint.xsOnly ? '6' : '12'"
    >
      <v-row class="pa-0">
        <v-col :cols="!$vuetify.breakpoint.smAndDown ? '6' : '12'">
          <v-text-field
            v-model="skill.value"
            :rules="required"
            :label="getLabel(skill.skillid)"
            type="number"
            hide-spin-buttons
            dense
            outlined
            required
            hide-details="auto"
          />
        </v-col>

        <v-col :cols="!$vuetify.breakpoint.smAndDown ? '6' : '12'">
          <v-text-field
            v-model="skill.count"
            :rules="required"
            :label="getLabel(skill.skillid) + ' Tries'"
            type="number"
            hide-spin-buttons
            dense
            outlined
            required
            hide-details="auto"
          />
        </v-col>
      </v-row>
    </v-col>
  </v-row>
</template>

<script lang="ts">
import Vue from 'vue'
import { dashboardCharacterSkills } from '@/store'
import { CharacterSkills } from '@/models'
import { skillName } from '@/utils/enum'

export default Vue.extend({
  data() {
    return {
      required: [
        (v: string) => !!v || 'Required field',
      ],
    }
  },

  computed: {
    $skills(): CharacterSkills[] {
      return dashboardCharacterSkills.$skills;
    },

    getSkillList(): Object[] {
      return skillName;
    }
  },

  methods: {
    getLabel(this: any, id: number): String {
      return this.getSkillList.some((skill: { value: number}) => skill.value === id)
        ? this.getSkillList.find((skill: { value: number}) => skill.value === id).text
        : "";
    }
  }
})
</script>