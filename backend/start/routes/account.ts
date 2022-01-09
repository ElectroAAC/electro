import Route from '@ioc:Adonis/Core/Route';

Route.post('/accounts/register', 'Account/Register.store');
Route.get('/accounts/register/:code', 'Account/Register.show');

Route.post('/accounts/forgot-password', 'Account/ForgotPassword.store')
Route.get('/accounts/forgot-password/:key', 'Account/ForgotPassword.show')
Route.put('/accounts/forgot-password', 'Account/ForgotPassword.update')

Route.get('/accounts', 'Account/Main.show').middleware('auth')