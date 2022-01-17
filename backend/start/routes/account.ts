import Route from '@ioc:Adonis/Core/Route';
import Env from '@ioc:Adonis/Core/Env'

Route.post('/accounts/register', 'Account/Register.store');
Route.get('/accounts/register/:code', 'Account/Register.show');

Route.post('/accounts/forgot-password', 'Account/ForgotPassword.store')
Route.get('/accounts/forgot-password/:key', 'Account/ForgotPassword.show')
Route.put('/accounts/forgot-password', 'Account/ForgotPassword.update')

Route.get('/accounts', 'Account/Main.show').middleware('auth')

Route.get('/accounts/characters/:id', 'Account/Characters.show').middleware('auth');
Route.post('/accounts/create-character', 'Account/Characters.store').middleware('auth');

Route.get('/accounts/change-character-name', ({ response }) => {
  response.status(200).send({ 
    enabled: Env.get('CHANGE_NAME'),
    points: Env.get('POINTS_TO_CHANGE_NAME')
  });
}).middleware('auth');

Route.post('/accounts/change-character-name', 'Account/Characters.update').middleware('auth');
Route.post('/accounts/delete-character', 'Account/Characters.destroy').middleware('auth');