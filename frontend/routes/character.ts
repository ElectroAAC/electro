import Character from '@/pages/character/index.vue'
import View from '@/pages/character/index.vue'

export default [
  {
    path: '/character',
    component: Character,
    name: 'Character',
    meta: {
      name: 'character'
    }
  },
  {
    path: '/character/:name',
    component: View,
    name: 'CharacterView',
    meta: {
      name: 'characterView'
    }
  },
]