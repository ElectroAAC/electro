<template>
  <v-form
    ref="form"
    class="text-center mt-10 pb-5"
    v-model="valid"
    @submit.prevent="validate"
    @keyup.native.enter="validate"
  >
    <v-row class="ma-0 pa-0 text-center">
      <v-col cols="12">
        Payment is approved automatically and your points will be delivered to your account. <br>
        Every 1 real donated is equal to {{ isDoublePoints ? 2 : 1 }} premium points.
      </v-col>

      <v-col :cols="!$vuetify.breakpoint.smAndDown ? '4' : '12'">
        <PixForm />
      </v-col>

      <v-col :cols="!$vuetify.breakpoint.smAndDown ? '4' : '12'">
        <v-btn
          depressed
          class="btn btn-success-primary"
          width="100%"
          rounded
          @click="validate"
        >
          Generate QRCode
        </v-btn>
      </v-col>
    </v-row>

    <Loading v-if="isLoading" style="width: 50%;"/>

    <v-row v-if="qrcode_image && qrcode_text" class="text-center ma-5 pa-0">
      <QRCode v-if="qrcode_image && !isLoading" :image="qrcode_image" class="mt-4" />
      <PixCode v-if="qrcode_text && !isLoading" :code="qrcode_text" class="mt-4" />
      <v-btn
        depressed
        class="btn btn-success-primary"
        width="100%"
        rounded
        @click="copyPix"
      >
        Copy PIX
      </v-btn>
    </v-row>
  </v-form>
</template>

<script lang="ts">
import Vue from 'vue'
import { account, shop, payment, pixPayment } from '@/store'

export default Vue.extend({
  data() {
    return {
      valid: true,
      qrcode_image: '',
      qrcode_text: '',
      isLoading: false
    }
  },

  computed: {
    pixIsActive: (): Boolean => shop.$payments.pix,
    isDoublePoints: (): Boolean => payment.$double_points
  },

  async mounted() {
    const promise = [
      payment.getDoublePoints()
    ];

    await Promise.all(promise);
  },

  methods: {
    async generateQRCode(this: any): Promise<void> {
      this.$set(this, 'isLoading', true);

      const res: { status: Number, result: { image: string, pix_qrcode: string } } = await pixPayment.generateQRCode({
        value: pixPayment.$value,
        account_id: account.$account.id
      });

      if (res.status === 200) {
        this.qrcode_image = res.result.image;
        this.qrcode_text = res.result.pix_qrcode;

        this.$toast.success(
          'QR Code generated.',
          {
            keepOnHover: true,
            duration: 2000,
            theme: "bubble",
          }
        )
      }
        
      else {
        this.$toast.error(
          res.result,
          {
            keepOnHover: true,
            duration: 2000,
            theme: "bubble",
          }
        )
      }

      this.$set(this, 'isLoading', false);
    },

    async validate(this: any): Promise<void> {
      await this.$refs.form.validate();
      if (this.valid)
        await this.generateQRCode();
    },

    copyPix() {
      navigator.clipboard.writeText(this.qrcode_text);

      this.$toast.success(
        'PIX copied to clipboard',
        {
          keepOnHover: true,
          duration: 2000,
          theme: "bubble",
        }
      )
    }
  }
})
</script>