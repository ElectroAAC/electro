import Route from '@ioc:Adonis/Core/Route';

Route.get('/player/:name', 'Players/Main.show');
Route.get('/player/:id/skills', 'Players/Skills.show');
Route.get('/player/:id/storage/:key', 'Players/Storage.show');
Route.get('/player/:id/deaths', 'Players/Deaths.show');
Route.get('/player/:id/items', 'Players/Items.show');