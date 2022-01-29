import Route from '@ioc:Adonis/Core/Route';

Route.get('/dashboard/account/:name', 'Dashboard/Accounts.show').middleware('auth');