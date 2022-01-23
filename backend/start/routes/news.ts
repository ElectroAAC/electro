import Route from '@ioc:Adonis/Core/Route';

Route.get('/news/:page/:limit', 'News/Main.show');

Route.post('/news/create-post', 'Dashboard/News.store').middleware('auth');