import Route from '@ioc:Adonis/Core/Route';

Route.get('/items/xml', 'Items/Main.loadXml').middleware('auth');
Route.get('/items/:type', 'Items/Main.show');