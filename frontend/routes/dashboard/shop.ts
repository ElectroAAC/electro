import Categories from '~/pages/dashboard/shop/categories/index.vue';
import CreateCategory from '~/pages/dashboard/shop/categories/create.vue';
import EditCategory from '~/pages/dashboard/shop/categories/edit.vue';
import Items from '~/pages/dashboard/shop/items/index.vue';
import CreateItem from '~/pages/dashboard/shop/items/create.vue';
import EditItem from '~/pages/dashboard/shop/items/edit.vue';

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
    component: CreateCategory,
    name: 'Dashboard - Shop Category Create',
    meta: {
      name: 'dashboard-shop-categories-create'
    }
  },
  {
    path: '/dashboard/shop/category/edit/:id',
    component: EditCategory,
    name: 'Dashboard - Shop Category Edit',
    meta: {
      name: 'dashboard-shop-categories-edit'
    }
  },
  {
    path: '/dashboard/shop/items',
    component: Items,
    name: 'Dashboard - Shop Items',
    meta: {
      name: 'dashboard-shop-items'
    }
  },
  {
    path: '/dashboard/shop/item/create',
    component: CreateItem,
    name: 'Dashboard - Shop Item Create',
    meta: {
      name: 'dashboard-shop-items-create'
    }
  },
  {
    path: '/dashboard/shop/item/edit/:id',
    component: EditItem,
    name: 'Dashboard - Shop Item Edit',
    meta: {
      name: 'dashboard-shop-items-edit'
    }
  },
];