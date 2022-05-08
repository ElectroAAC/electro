import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import { DeathService, UtilsService } from 'App/Services'

export default class LastKillsController {
  public deathService: DeathService = new DeathService();
  public utilsService: UtilsService = new UtilsService();

  public async show(ctx: HttpContextContract) {
    try {
      const { remote_url } = ctx.request.body();
      
      let players_deaths_count = 0;

      const last_kills: Object[] = [];

      const playersDeath: any = await this.deathService.getLastKills(ctx.request.param('page'), ctx.request.param('limit'));
      
      if (!playersDeath.length) {
        return ctx.response.status(404).send({ message: 'There are no recorded deaths.' });
      }

      for(let death of playersDeath) {
        players_deaths_count++;

        let killers_string = this.utilsService.generatePlayerLink(remote_url, death.victim) + ` died at level <strong> ${death.level} </strong> by `;
        
        death.is_player 
          ? killers_string += this.utilsService.generatePlayerLink(remote_url, death.killed_by)
          : killers_string += death.killed_by;
        
        killers_string += '.';

        last_kills.push({
          id: players_deaths_count,
          time: death.time,
          killers_string,
          world_id: 0
        })
      }

      return ctx.response.status(200).send({ status: 200, total: playersDeath.lastPage, last_kills });
    } catch(err) {
      console.log('Error getPlayersDeaths Query: ', err);
      return ctx.response.status(400).send({ error: 'An error occurred, check the api console.'});
    }
  }
}
