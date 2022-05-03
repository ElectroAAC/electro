import Route from '@ioc:Adonis/Core/Route';

Route.get('/shop/category/list', 'Dashboard/ShopCategory.index').middleware('auth');
Route.post('/shop/category/create', 'Dashboard/ShopCategory.store').middleware('auth');
Route.post('/shop/category/update', 'Dashboard/ShopCategory.update').middleware('auth');