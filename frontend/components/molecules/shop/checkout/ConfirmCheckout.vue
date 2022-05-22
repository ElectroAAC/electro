<template>
  <v-form
    ref="form"
    v-model="valid"
    @submit.prevent="validate"
    @keyup.native.enter="validate"
  >
    <BaseDialog
      v-if="dialogConfirm"
      title="Confirm Purchase"
      text="Do you want to make a purchase?"
      btn_text_action="Confirm"
      :dialog="dialogConfirm"
      @action-confirm="actionConfirm"
    />

    <v-row class="text-center">
      <v-col class="text-center" cols="12">
        Enter the name of the player who will receive the items.
      </v-col>      
      
      <v-col cols="6">
        <v-text-field
          v-model="to_player_name"
          :rules="required"
          label="Player Name"
          dense
          outlined
          rounded
          required
          hide-details="auto"
        />
      </v-col>

      <v-col class="text-center" cols="12">
        <v-btn
          depressed
          class="mt-5 btn btn-success-primary"
          rounded
          @click="validate"
        >
          <v-icon> mdi-currency-usd </v-icon>
          Checkout
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
    </v-row>
  </v-form>
</template>

<script lang="ts">
import Vue from 'vue'
import { account, shop } from '@/store'

export default Vue.extend({
  data() {
    return {
      dialogConfirm: false,
      valid: true,
      to_player_name: "",
      required: [
        (v: string) => !!v || 'Required field',
      ],
    }
  },

  computed: {
    $account() {
      return account.$account;
    },

    $cart() {
      return shop.$cart;
    }
  },

  methods: {
    back() {
      shop.changeCheckout(false);
    },

    resetPurchase() {
      shop.setToPlayerName(this.to_player_name);
      shop.resetPurchase();
      this.$router.replace('/shop/purchase-made');
    },

    async finalizePurchase() {
      const res = await shop.finalizePurchase({
        from_account_id: this.$account.id,
        from_nick: "",
        to_player_name: this.to_player_name,
        items: this.$cart.map((item) => {
          return {
            itemId: item.offer_id,
            amount: item.amount
          }
        }),
      });

      if (res.status === 200) {
        this.$toast.success(
          res.message,
          {
            keepOnHover: true,
            duration: 2000,
            theme: "bubble",
          }
        );
        this.resetPurchase();
      }

      else if (res.data.errors.length) {
        this.$toast.error(
          res.data.errors[0].message,
          {
            keepOnHover: true,
            duration: 4000,
            theme: "bubble",
          }
        )
      }

      else {
        this.$toast.error(
          'An error has occurred.',
          {
            keepOnHover: true,
            duration: 4000,
            theme: "bubble",
          }
        )
      }
    },

    actionConfirm(status: boolean, action: boolean): void {
      if (action) {
        this.finalizePurchase();
      }
      this.$set(this, 'dialogConfirm', status);
    },

    async validate(this: any): Promise<void> {
      await this.$refs.form.validate();
      
      if (this.valid)
        this.$set(this, 'dialogConfirm', true);
    }
  }
})
</script>