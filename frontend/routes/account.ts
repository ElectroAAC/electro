import Accounts from '@/pages/accounts/index.vue'
import CreateCharacter from '~/pages/accounts/character/create.vue'
import ChangeName from '~/pages/accounts/character/changeName.vue'

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
  {
    path: '/accounts/change-name',
    component: ChangeName,
    name: 'Change Name',
    meta: {
      name: 'change-name'
    }
  },
]