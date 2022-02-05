import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import { DeathService } from 'App/Services'

interface Death {
  player_name: String,
  monster_name: String,
  player_exists: Number
}
export default class LastKillsController {
  public deathService: DeathService = new DeathService();

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

        const url_player = remote_url + '/' + death.name;
        
        let killers_string = '<a href="'+ url_player + '">' + death.name + '</a> ';

        const killers: Death[] = await this.deathService.getKillers(death.id) as Death[];

        let i = 0;
        let count = killers.length;

        for(let killer of killers) {
          i++;
          if (killer.player_name && killer.player_name !== "") {
            
            if (i === 1) {
              if (count) {
                killers_string += " killed";
                killers_string += " at level <b>" + death.level + "</b>"; 
              }
            } 
            
            else if (i === count) {
              killers_string += " and";
            } 

            else
              killers_string += ",";

            killers_string += " by ";

            if (killer.monster_name)
              killers_string += killer.monster_name;
            
            const url = remote_url + '/' + killer.player_name;

            if (killer.player_exists === 0) 
              killers_string += '<a href="'+ url + '">' + killer.player_name + '</a> ';
          } 
          
          else {
            if (i === 1)
              killers_string += "died at level <b>" + death.level + "</b>";

            else if (i === count)
              killers_string += " and";
                
            else
              killers_string += ",";

            killers_string += " by " + killer.monster_name;
          }
        }

        killers_string += ".";
        last_kills.push({
          id: players_deaths_count,
          time: death.date,
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
