import Route from '@ioc:Adonis/Core/Route';

Route.get('/shop/offers/:categorie', 'Shop/Main.show').middleware('auth');
Route.post('/shop/purchase', 'Shop/Main.store').middleware('auth');