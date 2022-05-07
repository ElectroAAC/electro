import Route from '@ioc:Adonis/Core/Route';

Route.get('/news/list/:page/:limit', 'News/Main.show');

Route.get('/news/listDashboard/:page/:limit', 'Dashboard/News.index');

Route.post('/news/create', 'Dashboard/News.store').middleware('auth');
Route.get('/news/find/:id', 'Dashboard/News.show').middleware('auth');
Route.patch('/news/edit', 'Dashboard/News.update').middleware('auth');