import Route from '@ioc:Adonis/Core/Route';

Route.get('/news/list/:page/:limit', 'News/Main.show');

Route.get('/news/listDashboard/:page/:limit', 'Dashboard/News.index');

Route.post('/news/create-post', 'Dashboard/News.store').middleware('auth');
Route.get('/news/find/:id', 'Dashboard/News.show').middleware('auth');
Route.post('/news/edit', 'Dashboard/News.update').middleware('auth');