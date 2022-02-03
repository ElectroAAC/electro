import Accounts from '~/pages/dashboard/accounts/accounts.vue'
import Edit from '~/pages/dashboard/accounts/edit.vue'

export default [
  {
    path: '/dashboard/accounts',
    component: Accounts,
    name: 'Dashboard - Find Account',
    meta: {
      name: 'dashboard-find-account'
    }
  },
  {
    path: '/dashboard/account/:name',
    component: Edit,
    name: 'Dashboard - Account',
    meta: {
      name: 'dashboard-account'
    }
  },
]