import Manage from '~/pages/guilds/manage/manage.vue'
import ChangeMotd from '~/pages/guilds/manage/motd.vue'
import ChangeDescription from '~/pages/guilds/manage/description.vue'
import Leadership from '~/pages/guilds/manage/leadership.vue'
import Delete from '~/pages/guilds/manage/delete.vue'

export default [
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
  {
    path: '/guild/manage/:name/pass-leadership',
    component: Leadership,
    name: 'Pass Leadership',
    meta: {
      name: 'Pass Leadership'
    }
  },
  {
    path: '/guild/manage/:name/delete',
    component: Delete,
    name: 'Delete',
    meta: {
      name: 'Delete'
    }
  },
]