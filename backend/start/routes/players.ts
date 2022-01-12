import Route from '@ioc:Adonis/Core/Route';

Route.get('/player/:id', 'Players/Main.show');
Route.get('/player/:id/skills', 'Players/Skills.show');
Route.get('/player/:id/storage/:key', 'Players/Storage.show');