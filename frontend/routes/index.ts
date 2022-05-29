import Account from '~/routes/account'
import Character from '~/routes/character'
import Creatures from '~/routes/creatures'
import Dashboard from '~/routes/dashboard/index'
import Download from '~/pages/download.vue';
import Guilds from '~/routes/guild/main'
import Highscores from '~/pages/highscores.vue';
import IndexPage from '~/pages/index.vue';
import Items from '~/routes/items'
import Lastkills from '~/pages/lastkills.vue';
import Online from '~/pages/online.vue';
import Shop from '~/routes/shop'

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
  ...Creatures,
  ...Guilds,
  ...Items,
  ...Shop
]