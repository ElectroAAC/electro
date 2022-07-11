import Route from '@ioc:Adonis/Core/Route';

Route.get('/server/max-players', 'Server/ServerController.maxPlayers');