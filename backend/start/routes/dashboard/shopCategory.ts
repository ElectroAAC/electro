import Route from '@ioc:Adonis/Core/Route';

Route.get('/shop/category/list/:page/:limit', 'Dashboard/ShopCategory.index').middleware('auth');
Route.get('/shop/category/find/:id', 'Dashboard/ShopCategory.show').middleware('auth');
Route.post('/shop/category/create', 'Dashboard/ShopCategory.store').middleware('auth');
Route.put('/shop/category/update', 'Dashboard/ShopCategory.update').middleware('auth');
Route.delete('/shop/category/destroy/:id', 'Dashboard/ShopCategory.destroy').middleware('auth');