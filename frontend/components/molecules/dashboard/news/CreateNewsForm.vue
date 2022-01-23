 <template>
   <div>
     <v-row>
      <v-col cols="12">
        <v-text-field
          v-model="title"
          label="Title"
          type="text"
          validate-on-blur
          dense
          outlined
          required
          hide-details="auto"
        />
      </v-col>

      <v-col cols="12">
        <editor
          api-key="waj6mynu6qydcrd3kx0jqz4hpm143zpiyzud6yppdsr91yzf"
          v-model="text"
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

export default Vue.extend({
   name: 'app',
   components: {
     'editor': Editor
   },

   data() {
     return {
       text: "",
       title: ""
     }
   }
})
</script>
