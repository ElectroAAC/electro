import Route from '@ioc:Adonis/Core/Route';

Route.post('/payments/pix/qrcode', 'Payments/Pix.getQRCode');