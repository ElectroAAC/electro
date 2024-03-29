<template>
  <v-container>
    <BaseDialog
      v-if="dialogDelete"
      title="Remove Item"
      text="Do you want to remove the product from your shopping list?"
      btn_text_action="Confirm"
      :dialog="dialogDelete"
      @action-confirm="actionConfirm"
    />

    <Loading v-if="loading" style="width: 50% !important;"/>

    <div v-else>
      <v-col class="text-center mb-2" cols="12">
        Check the products in your cart, choose the quantity and confirm the purchase.
      </v-col>

      <v-row v-if="!$vuetify.breakpoint.xsOnly" class="pa-0">
        <v-col class="header-table text-center" cols="6">
          Product
        </v-col>

        <v-col class="header-table text-center" cols="3">
          Price
        </v-col>

        <v-col class="header-table text-center" cols="3">
          Amount
        </v-col>
      </v-row>

      <v-row v-for="(item, idx) in $cart" :key="idx" class="align-center shop-item pa-0 mb-3">
        <v-col class="text-center" cols="1">
          <v-btn icon @click="dialogDelete = true, deleteItemIndex = idx">
            <v-icon color="white">
              mdi-delete-outline
            </v-icon>
          </v-btn>
        </v-col>

        <v-col class="text-center d-flex align-center" :cols="$vuetify.breakpoint.xsOnly ? '8' : '5'"> 
          <ItemImage :image="item.item_id" :image_name="item.name"/>
          {{ item.name }} 
        </v-col>

        <v-col class="color-orange bold text-center" cols="3"> 
          {{ item.price }} <span v-if="$vuetify.breakpoint.xsOnly"> Points </span>
        </v-col>

        <v-col class="text-center" :cols="$vuetify.breakpoint.xsOnly ? '12' : '3'"> 
          <v-row class="pa-0">
            <v-col class="text-center" cols="3">
              <v-btn icon :disabled="item.amount <= 1" @click="decreaseTheAmount(idx)">
                <v-icon color="white"> mdi-minus </v-icon>
              </v-btn>
            </v-col>

            <v-col class="text-center" cols="6">
              <v-text-field 
                v-model="item.amount"
                :rules="rules"
                type="number"
                dense
                outlined
                required
                hide-details="auto"
                @change="($event) => {
                  $event < 0 
                    ? item.amount = item.amount * -1 
                    : (
                        $event == 0 
                          ? item.amount = 1 
                          : null
                      );
                }"
              />
            </v-col>

            <v-col class="text-center" cols="3">
              <v-btn icon @click="increaseTheAmount(idx)">
                <v-icon color="white"> mdi-plus </v-icon>
              </v-btn>
            </v-col>
          </v-row>
        </v-col>
      </v-row>

      <v-col class="text-center" cols="12">
        The total amount of the current purchase is: <span class="bold color-orange"> {{ getTotalAmount }} points.</span> 
      </v-col>
    </div>
  </v-container>
</template>

<script lang="ts">
import Vue from 'vue'
import { shop } from '@/store'

export default Vue.extend({
  data() {
    return {
      loading: false,
      dialogDelete: false,
      deleteItemIndex: null,
      rules: [
        (v: string) => !!v || 'Required field'
      ]
    }
  },
  
  computed: {
    $cart() {
      return shop.$cart;
    },
    getTotalAmount() {
      return shop.$cart.reduce(
        (previousValue, currentValue) => { return previousValue + currentValue.price}, 0
      );
    }
  },

  methods: {
    increaseTheAmount(idx: number) {
      this.$cart[idx].amount = parseInt(this.$cart[idx].amount) + 1;
      this.$cart[idx].price = this.$cart[idx].originalPrice * this.$cart[idx].amount;
    },

    decreaseTheAmount(idx: number) {
      if (parseInt(this.$cart[idx].amount) <= 1) {
        return;
      }

      this.$cart[idx].amount = parseInt(this.$cart[idx].amount) - 1;
      this.$cart[idx].price = this.$cart[idx].originalPrice * this.$cart[idx].amount;
    },

    onDelete(this: any): void{
      this.$set(this, 'loading', true);
  
      this.$cart.splice(this.deleteItemIndex, 1);

      this.$set(this, 'dialogDelete', false);
      this.$set(this, 'deleteItemIndex', null);

      this.$toast.success(
        'Product successfully removed.',
        {
          keepOnHover: true,
          duration: 2000,
          theme: "bubble",
        }
      )

      setTimeout(() => {
        this.$set(this, 'loading', false);
      }, 300);
    },

    actionConfirm(status: boolean, action: boolean): void {
      if (action) {
        this.onDelete();
      }
      this.$set(this, 'dialogDelete', status);
    },
  }
})
</script>