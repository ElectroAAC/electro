import IndexPage from '~/pages/index.vue';
import Highscores from '~/pages/highscores.vue';
import Dashboard from '~/routes/dashboard/index'
import Account from '~/routes/account'
import Character from '~/routes/character'

export default [
  {
    path: '/',
    component: IndexPage,
  },
  {
    path: '/highscores',
    component: Highscores
  },
  ...Dashboard,
  ...Account,
  ...Character,
]