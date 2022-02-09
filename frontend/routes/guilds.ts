import Guilds from '@/pages/guilds/index.vue'
import View from '@/pages/guilds/view.vue'
import Create from '@/pages/guilds/create.vue'
import Manage from '@/pages/guilds/manage.vue'
import ChangeMotd from '@/pages/guilds/motd.vue'
import ChangeDescription from '@/pages/guilds/description.vue'

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
  {
    path: '/guild/manage/:name',
    component: Manage,
    name: 'Manage Guild',
    meta: {
      name: 'Manage Guild'
    }
  },
  {
    path: '/guild/manage/:name/change-motd',
    component: ChangeMotd,
    name: 'Change MOTD',
    meta: {
      name: 'Change MOTD'
    }
  },
  {
    path: '/guild/manage/:name/change-description',
    component: ChangeDescription,
    name: 'Change Description',
    meta: {
      name: 'Change Description'
    }
  },
]