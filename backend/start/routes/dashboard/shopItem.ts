import Route from '@ioc:Adonis/Core/Route';

Route.get('/shop/item/list/:page/:limit', 'Dashboard/ShopItem.index').middleware('auth');
Route.get('/shop/item/find/:id', 'Dashboard/ShopItem.show').middleware('auth');
Route.post('/shop/item/create', 'Dashboard/ShopItem.store').middleware('auth');
Route.put('/shop/item/update', 'Dashboard/ShopItem.update').middleware('auth');
Route.delete('/shop/item/destroy/:id', 'Dashboard/ShopItem.destroy').middleware('auth');