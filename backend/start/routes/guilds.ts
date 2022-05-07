import Route from '@ioc:Adonis/Core/Route';

Route.get('/guilds/:page/:limit', 'Guilds/Main.index');
Route.get('/guild/view/:name', 'Guilds/Main.show').middleware('silence');

Route.get('/guild/players-without-guild', 'Guilds/PlayersWithoutGuild.show').middleware('auth');

Route.post('/guild/create-guild', 'Guilds/Main.create').middleware('auth');

Route.post('/guild/invites', 'Guilds/Invite.index').middleware('auth');
Route.post('/guild/invite', 'Guilds/Invite.store').middleware('auth');
Route.post('/guild/accept-invite', 'Guilds/Invite.update').middleware('auth');
Route.post('/guild/cancel-invite', 'Guilds/Invite.delete').middleware('auth');

Route.post('/guild/leave', 'Guilds/Main.leave').middleware('auth');

Route.post('/guild/pass-leadership', 'Guilds/Manage.passLeadership').middleware('auth');
Route.post('/guild/change-motd', 'Guilds/Manage.changeMotd').middleware('auth');
Route.post('/guild/change-rank', 'Guilds/Manage.changeRank').middleware('auth');
Route.post('/guild/change-description', 'Guilds/Manage.changeDescription').middleware('auth');
Route.post('/guild/delete', 'Guilds/Manage.delete').middleware('auth');