 <template>
   <div>
     <v-row>
      <v-col cols="10">
        <v-text-field
          v-model="$categorie.name"
          :rules="required"
          label="Name"
          type="text"
          validate-on-blur
          dense
          outlined
          required
          hide-details="auto"
        />
      </v-col>

      <v-col cols="2">
        <v-checkbox
          v-model="$categorie.hidden"
          class="ma-2 pa-0"
          color="primary"
          label="Hidden"
          hide-details
        />
      </v-col>

      <v-col cols="12">
        <v-text-field
          v-model="$categorie.description"
          :rules="required"
          label="Description"
          type="text"
          validate-on-blur
          dense
          outlined
          required
          hide-details="auto"
        />
      </v-col>
    </v-row>
  </div>
</template>

<script lang="ts">
import Vue from 'vue'
import { dashboardShopCategory } from '@/store'

export default Vue.extend({
  name: 'app',

  data() {
    return {
      required: [
        (v: string) => !!v || 'Required field',
      ],
    }
  },

  computed: {
    $categorie() {
      return dashboardShopCategory.$categorie;
    }
  },
})
</script>
