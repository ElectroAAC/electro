import Guilds from '@/pages/guilds/index.vue'
import View from '@/pages/guilds/view.vue'

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
    path: '/guilds/:name',
    component: View,
    name: 'View Guild',
    meta: {
      name: 'View Guild'
    }
  },
]