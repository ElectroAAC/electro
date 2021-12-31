import Route from '@ioc:Adonis/Core/Route';
import './auth';

Route.get('/', async () => {
  return { hello: 'world' }
})
