import Categories from '~/pages/dashboard/shop/categories/index.vue';
import Create from '~/pages/dashboard/shop/categories/create.vue';

export default [
  {
    path: '/dashboard/shop/categories',
    component: Categories,
    name: 'Dashboard - Shop Categories',
    meta: {
      name: 'dashboard-shop-categories'
    }
  },
  {
    path: '/dashboard/shop/category/create',
    component: Create,
    name: 'Dashboard - Shop Category Create',
    meta: {
      name: 'dashboard-shop-categories-create'
    }
  },
];