import Route from '@ioc:Adonis/Core/Route';

Route.get('/doublepoints', 'Payments/DoublePoints.show');
Route.post('/payments/pix/qrcode', 'Payments/Pix.getQRCode');
Route.post('/payments/pix/webhook(/pix)', 'Payments/Pix.webhook');