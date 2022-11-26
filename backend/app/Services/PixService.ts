import Env from '@ioc:Adonis/Core/Env'
const fs = require('fs');
const https = require('https');
const path = require('path');
const axios = require('axios');

class PixView {
  public async getAgent(cert: any): Promise<Object> {  
    const agent = new https.Agent({
      pfx: cert,
      passphrase: ''
    });
    return agent;
  }
}

class Pix {
  public async loadCertificate(): Promise<any> {
    try {
      const cert = fs.readFileSync(path.resolve(__dirname, `../../contracts/certs/${Env.get('PIX_CERT')}`))
      return cert;
    }
    catch (err) {
      return 'Error: Cannot load certificate. File not found.';
    }
  }
}

class PixRepository {
  public async getAuthentication(agent): Promise<Object> {
    const credentials = Buffer.from(
      `${Env.get('PIX_CLIENT_ID')}:${Env.get('PIX_CLIENT_SECRET')}`
    ).toString('base64');

    const options = {
      method: 'POST',
      url: `${Env.get('PIX_ENDPOINT')}/oauth/token`,
      headers: {
        Authorization: `Basic ${credentials}`,
        'Content-Type': 'application/json'
      },
      httpsAgent: agent,
      data: {
        grant_type: 'client_credentials'
      }
    };

    return axios(options);
  }

  public async pixRequest(agent): Promise<any> {
    const authResponse = await this.getAuthentication(agent);
    // @ts-ignore: Unreachable code error
    const accessToken = authResponse.data?.access_token;

    return axios.create({
      baseURL: Env.get('PIX_ENDPOINT'),
      httpsAgent: agent,
      headers: {
        Authorization: `Bearer ${accessToken}`,
        'Content-Type': 'application/json'
      }
    });
  }
}

export { Pix, PixView, PixRepository }