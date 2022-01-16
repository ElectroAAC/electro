import Accounts from '@/pages/accounts/index.vue'
import CreateCharacter from '@/pages/accounts/createCharacter.vue'

export default [
  {
    path: '/accounts',
    component: Accounts,
    name: 'Account',
    meta: {
      name: 'account'
    }
  },
  {
    path: '/accounts/create-character',
    component: CreateCharacter,
    name: 'Create Character',
    meta: {
      name: 'create-character'
    }
  },
]