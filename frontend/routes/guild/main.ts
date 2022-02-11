import Invite from './invite'
import Manage from './manage'
import Guilds from '@/pages/guilds/index.vue'
import View from '@/pages/guilds/view.vue'
import Create from '@/pages/guilds/create.vue'

export default [
  {
    path: '/guilds',
    component: Guilds,
    name: 'Guilds',
    meta: {
      name: 'guilds'
    }
  },
  {
    path: '/guilds/view/:name',
    component: View,
    name: 'View Guild',
    meta: {
      name: 'View Guild'
    }
  },
  {
    path: '/guilds/create',
    component: Create,
    name: 'Create Guild',
    meta: {
      name: 'Create Guild'
    }
  },
  ...Invite,
  ...Manage
]