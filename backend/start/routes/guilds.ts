import Route from '@ioc:Adonis/Core/Route';

Route.get('/guilds/:page/:limit', 'Guilds/Main.index');
Route.get('/guild/view/:name', 'Guilds/Main.show');

Route.get('/guild/players-with-guild', 'Guilds/PlayersWithGuild.show').middleware('auth');

Route.post('/guild/create-guild', 'Guilds/Main.create').middleware('auth');