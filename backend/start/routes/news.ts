import Route from '@ioc:Adonis/Core/Route';

Route.post('/news/:page/:limit', 'News/Main.show');