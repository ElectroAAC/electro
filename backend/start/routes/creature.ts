import Route from '@ioc:Adonis/Core/Route';

Route.get('/creatures/xml', 'Creature/Main.loadXml').middleware('auth');
Route.get('/creatures/:page/:limit', 'Creature/Main.show');