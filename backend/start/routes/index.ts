import Route from '@ioc:Adonis/Core/Route';
import './auth';
import './account';
import './highscores';
import './players';
import './dashboard';
import './guilds';
import './online';
import './lastkills';

Route.get('/', async () => {
  return { hello: 'world' }
})

Route.get('/account-register', async ({ view }) => {
  return view.render('emails/register')
})