import Route from '@ioc:Adonis/Core/Route';
import Env from '@ioc:Adonis/Core/Env'

Route.get('/player/:name', 'Players/Main.show');
Route.get('/player/:id/skills', 'Players/Skills.show');
Route.post('/player/:id/deaths', 'Players/Deaths.show');
Route.get('/player/:id/items', 'Players/Items.show');
Route.get('/player/:id/storage/:key', 'Players/Storage.show');
Route.get('/player/:id/storages', 'Players/Storage.characterStorages');

// Change name
Route.get('/player/change-name', ({ response }) => {
  response.status(200).send({ 
    enabled: Env.get('CHANGE_NAME'),
    points: Env.get('POINTS_TO_CHANGE_NAME')
  });
}).middleware('auth');
Route.post('/player/change-name', 'Players/Main.changeName').middleware('auth');

Route.post('/player/delete-character', 'Players/Main.destroy').middleware('auth');