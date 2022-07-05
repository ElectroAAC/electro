import Env from '@ioc:Adonis/Core/Env'
const fs = require('fs');
const jsonString = fs.readFileSync(`${Env.get('SERVER_PATH')}config.lua`, 'utf8');

class Server {
  public getConfig(): any {
    const result: any[] = [];
    const configLua = {};
    
    jsonString.split("\n").forEach((item: string) => {
      result.push(item.split(" = "));
    });

    result.forEach((item: any) => {
      configLua[item[0]] = item[1] ? item[1].replaceAll('"', "").replaceAll("'", "") : "";
    });
    return configLua;
  }

  public getHost(): String {
    return this.getConfig().ip;
  }

  public getPort(): Number {
    return this.getConfig().statusProtocolPort;
  }
}

export { Server };