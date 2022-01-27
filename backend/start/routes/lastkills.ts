import Route from '@ioc:Adonis/Core/Route';

Route.post('/lastkills/:page/:limit', 'Lastkills/Main.show');