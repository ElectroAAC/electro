import Invite from '@/pages/guilds/invite/invite.vue'
import Accept from '@/pages/guilds/invite/accept.vue'

export default [
  {
    path: '/guild/invite/:name',
    component: Invite,
    name: 'Invite Guild',
    meta: {
      name: 'Invite Guild'
    }
  },
  {
    path: '/guild/accept-invite/:name/',
    component: Accept,
    name: 'Accept Guild',
    meta: {
      name: 'Accept Guild'
    }
  },
]