import Route from '@ioc:Adonis/Core/Route';

Route.get('/dashboard/character/:name', 'Dashboard/Players.show').middleware('auth');
Route.post('/dashboard/character/', 'Dashboard/Players.update').middleware('auth');