import Dashboard from '~/pages/dashboard/index.vue'
import Accounts from '~/routes/dashboard/account'
import Newsa from '~/routes/dashboard/newsa'

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
  ...Newsa
]