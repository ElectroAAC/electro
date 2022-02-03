import Dashboard from '~/pages/dashboard/index.vue'
import Accounts from '~/routes/dashboard/account'
import Characters from '~/routes/dashboard/character'
import News from '~/routes/dashboard/news'

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
  ...Characters,
  ...News
]