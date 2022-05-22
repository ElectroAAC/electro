 <template>
   <v-row>
    <v-col cols="6">
      <v-text-field
        v-model="$item.name"
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

    <v-col cols="6">
      <v-autocomplete
        v-model="$item.category_id"
        :rules="required"
        :items="$categories"
        label="Category"
        dense
        outlined
        hide-details="auto"
      />
    </v-col>

    <v-col cols="4">
      <v-text-field
        v-model="$item.price"
        :rules="required"
        label="Price"
        type="number"
        validate-on-blur
        dense
        outlined
        required
        hide-details="auto"
      />
    </v-col>

    <v-col cols="4">
      <v-text-field
        v-model="$item.itemId1"
        :rules="required"
        label="ItemID"
        type="number"
        validate-on-blur
        dense
        outlined
        required
        hide-details="auto"
      />
    </v-col>

    <v-col cols="4">
      <v-text-field
        v-model="$item.count1"
        :rules="required"
        label="Count"
        type="number"
        validate-on-blur
        dense
        outlined
        required
        hide-details="auto"
      />
    </v-col>

    <v-col cols="12">
      <v-text-field
        v-model="$item.description"
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
</template>

<script lang="ts">
import Vue from 'vue'
import { 
  dashboardShopItem,
  shopCategorie
} from '@/store'

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
    $item() {
      return dashboardShopItem.$item;
    },
    $categories() {
      return shopCategorie.$categories.map((category) => {
        return {
          value: category.id,
          text: category.name
        }
      });
    }
  },
})
</script>
