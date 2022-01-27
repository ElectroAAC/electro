import IndexPage from '~/pages/index.vue';
import Highscores from '~/pages/highscores.vue';
import Online from '~/pages/online.vue';
import Lastkills from '~/pages/lastkills.vue';
import Download from '~/pages/download.vue';

import Dashboard from '~/routes/dashboard/index'
import Account from '~/routes/account'
import Character from '~/routes/character'
import Guilds from '~/routes/guilds'

export default [
  {
    path: '/',
    component: IndexPage,
  },
  {
    path: '/highscores',
    component: Highscores
  },
  {
    path: '/online',
    component: Online
  },
  {
    path: '/lastkills',
    component: Lastkills
  },
  {
    path: '/downloads',
    component: Download
  },
  ...Dashboard,
  ...Account,
  ...Character,
  ...Guilds
]