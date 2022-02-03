import Character from '~/pages/dashboard/characters/index.vue'
import Edit from '~/pages/dashboard/characters/edit.vue'

export default [
  {
    path: '/dashboard/characters',
    component: Character,
    name: 'Dashboard - Find Character',
    meta: {
      name: 'dashboard-find-character'
    }
  },
  {
    path: '/dashboard/character/:name',
    component: Edit,
    name: 'Dashboard - Character',
    meta: {
      name: 'dashboard-character'
    }
  },
]