import Route from '@ioc:Adonis/Core/Route';

Route.post('/shop/category/create', 'Dashboard/ShopCategory.store').middleware('auth');