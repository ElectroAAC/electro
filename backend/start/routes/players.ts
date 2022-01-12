import Route from '@ioc:Adonis/Core/Route';

Route.get('/player/:id', 'Players/Main.show');