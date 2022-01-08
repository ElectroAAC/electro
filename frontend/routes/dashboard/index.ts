import Dashboard from '~/pages/dashboard/index.vue'
import Accounts from '~/routes/dashboard/account'

export default [
  {
    path: '/dashboard',
    component: Dashboard,
    name: 'Dashboard',
    meta: {
      name: 'dashboard'
    }
  },
  ...Accounts,
]