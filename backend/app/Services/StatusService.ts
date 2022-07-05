const Net = require('net');
const client = new Net.Socket();

class Status {
  public async getStatus(host: String, port: Number) {
    try {
      return await new Promise((resolve, reject) => {
        client.connect({ port, host }, () => {
          resolve(true);
        });

        client.on('error', () => {
          reject(false);
        });
      });
    }
    catch (err) {
      console.log(err);
      return false;
    }
  }
}

export { Status };