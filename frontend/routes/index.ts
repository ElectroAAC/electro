import IndexPage from '~/pages/index.vue';
import Highscores from '~/pages/highscores.vue';
import Dashboard from '~/routes/dashboard/index'

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
]