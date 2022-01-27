import Route from '@ioc:Adonis/Core/Route';

Route.get('/highscores', 'Highscores/Main.show');
Route.get('/highscores/:page/:limit', 'Highscores/Main.getRank');