import Route from '@ioc:Adonis/Core/Route';
import './auth';
import './account';
import './highscores';
import './players';
import './dashboard/home';
import './dashboard/accounts';
import './dashboard/character';
import './guilds';
import './online';
import './lastkills';
import './news';

Route.get('/', async () => {
  return { hello: 'world' }
})

Route.get('/account-register', async ({ view }) => {
  return view.render('emails/register')
})