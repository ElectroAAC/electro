import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import { DeathService } from 'App/Services'

interface PlayerDeath {
  id: number,
  date: number,
  level: number
}
interface Death {
  player_name: String,
  monster_name: String,
  player_exists: Number
}
export default class PlayerDeathsController {
  public deathService: DeathService = new DeathService();
  
  public async show(ctx: HttpContextContract) {
    try {
      const { remote_url } = ctx.request.body();
      
      const deaths: Object[] = [];

      const player_deaths: PlayerDeath[] = await this.deathService.getDeathsByCharacterId(ctx.request.param('id')) as PlayerDeath[];
      
      for(let death of player_deaths) {
        const killers: Death[] = await this.deathService.getInfoDeathCharacterById(death.id) as Death[];

        let description = '';
        let i = 0;
        let count = killers.length;
        
        for(let killer of killers) {
          i++;
          if(killer.player_name && killer.player_name !== "")
          {
            if(i === 1)
              description += "Killed at level <b> " + death.level + "</b>";
            else if(i === count)
              description += " and";
            else
              description += ",";

            description += " by ";
            if(killer.monster_name && killer.monster_name !== "")
              description += killer.monster_name + " summoned by ";

            const url = remote_url + '/' + killer.player_name;

            if(killer.player_exists === 0)
              description += '<a href="'+ url + '">' + killer.player_name + '</a> ';
            else
              description += killer.player_name;
          }
          else
          {
            if(i === 1)
              description += "Died at level <b>" + death.level + "</b>";
            else if(i === count)
              description += " and";
            else
              description += ",";

            description += " by " + killer.monster_name;
          }
        };

        deaths.push({
          'time': death['date'], 
          'description': description + '.'
        })
      }
      return ctx.response.status(200).send({ result: deaths});

    } catch(err) {
      console.log('Error getPlayerDeaths Query: ', err);
      return ctx.response.status(400).send({ message: 'An error occurred, check the api console.'})
    }
  }
}
