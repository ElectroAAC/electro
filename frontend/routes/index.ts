import IndexPage from '~/pages/index.vue';
import Highscores from '~/pages/highscores.vue';

export default [
  {
    path: '/',
    component: IndexPage,
  },
  {
    path: '/highscores',
    component: Highscores
  }
]