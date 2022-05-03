import Route from '@ioc:Adonis/Core/Route';

Route.post('/shop/purchase', 'Shop/Main.store').middleware('auth');