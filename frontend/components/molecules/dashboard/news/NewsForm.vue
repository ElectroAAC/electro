 <template>
   <div>
     <v-row>
      <v-col cols="10">
        <v-text-field
          v-model="$post.title"
          :rules="required"
          label="Title"
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
          v-model="$post.hidden"
          class="ma-2 pa-0"
          color="primary"
          label="Hidden"
          hide-details
        />
      </v-col>

      <v-col cols="12">
        <editor
          :api-key="getKeyTiny"
          v-model="$post.description"
          :rules="required"
          :init="{
            height: 500,
            menubar: true,
            plugins: [
              'advlist autolink lists link image charmap print preview anchor',
              'searchreplace visualblocks code fullscreen',
              'insertdatetime media table paste code help wordcount'
            ],
            toolbar:
              'image | undo redo | formatselect | bold italic backcolor | \
              alignleft aligncenter alignright alignjustify | \
              bullist numlist outdent indent | removeformat | help'
          }"
        />
      </v-col>
    </v-row>
  </div>
</template>

<script lang="ts">
import Vue from 'vue'
import Editor from '@tinymce/tinymce-vue'
import { dashboardNews } from '@/store'

export default Vue.extend({
  name: 'app',
  components: {
    'editor': Editor
  },

  data() {
    return {
      required: [
        (v: string) => !!v || 'Required field',
      ],
    }
  },

  computed: {
    $post() {
      return dashboardNews.$post;
    },
    
    getKeyTiny() {
      return process.env.TINY_KEY;
    }
  },
})
</script>
