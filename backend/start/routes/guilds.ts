import Route from '@ioc:Adonis/Core/Route';

Route.get('/guilds/:page/:limit', 'Guilds/Main.index');
Route.get('/guilds/:name', 'Guilds/Main.show');

Route.post('/guilds/create-guild', 'Guilds/Main.create').middleware('auth');