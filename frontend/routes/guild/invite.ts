import Invite from '@/pages/guilds/invite/invite.vue'

export default [
  {
    path: '/guild/invite/:name',
    component: Invite,
    name: 'Invite Guild',
    meta: {
      name: 'Invite Guild'
    }
  },
]