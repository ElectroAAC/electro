import Categories from '~/pages/dashboard/shop/categories/index.vue';
import Create from '~/pages/dashboard/shop/categories/create.vue';
import Edit from '~/pages/dashboard/shop/categories/edit.vue';

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
  {
    path: '/dashboard/shop/category/edit/:id',
    component: Edit,
    name: 'Dashboard - Shop Category Edit',
    meta: {
      name: 'dashboard-shop-categories-edit'
    }
  },
];