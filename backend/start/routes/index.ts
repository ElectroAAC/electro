import Route from '@ioc:Adonis/Core/Route';
import './account';
import './auth';
import './character';
import './creature';
import './dashboard/home';
import './dashboard/accounts';
import './dashboard/character';
import './dashboard/shopCategory';
import './dashboard/shopItem';
import './guilds';
import './highscores';
import './items';
import './lastkills';
import './news';
import './online';
import './shop';

Route.get('/', async () => {
  return { hello: 'world' }
})

Route.get('/account-register', async ({ view }) => {
  return view.render('emails/register')
})