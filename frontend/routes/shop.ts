import Shop from '@/pages/shop/index.vue'
import ShopCheckout from '@/pages/shop/checkout.vue'
import PurchaseMade from '@/pages/shop/purchaseMade.vue'
import ShopPayment from '@/pages/shop/payment.vue'

export default [
  {
    path: '/shop',
    component: Shop,
    name: 'Shop',
    meta: {
      name: 'shop'
    }
  },
  {
    path: '/shop/checkout',
    component: ShopCheckout,
    name: 'Shop - Checkout',
    meta: {
      name: 'checkout'
    }
  },
  {
    path: '/shop/purchase-made',
    component: PurchaseMade,
    name: 'Shop - Purchase Made',
    meta: {
      name: 'purchase-made'
    }
  },
  {
    path: '/shop/payments',
    component: ShopPayment,
    name: 'Shop - Payment',
    meta: {
      name: 'payment'
    }
  },
]