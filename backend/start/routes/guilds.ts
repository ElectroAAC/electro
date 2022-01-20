import Route from '@ioc:Adonis/Core/Route';

Route.get('/guilds/:page/:limit', 'Guilds/Main.index');
Route.get('/guilds/search/:name', 'Guilds/Main.show');

Route.get('/guilds/players-with-guild', 'Guilds/PlayersWithGuild.show').middleware('auth');

Route.post('/guilds/create-guild', 'Guilds/Main.create').middleware('auth');