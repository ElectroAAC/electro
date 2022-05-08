import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import { DeathService, UtilsService } from 'App/Services'

interface PlayerDeath {
  player_id: number,
  time: number,
  level: number,
  killed_by: string,
  is_player: number,
  mostdamage_by: string,
  mostdamage_is_player: number,
  unjustified: number,
  mostdamage_unjustified: number,
}

export default class PlayerDeathsController {
  public deathService: DeathService = new DeathService();
  public utilsService: UtilsService = new UtilsService();
  
  public async show(ctx: HttpContextContract) {
    try {
      const { remote_url } = ctx.request.body();
      
      const deaths: Object[] = [];

      const player_deaths: PlayerDeath[] = await this.deathService.getDeathsByCharacterId(ctx.request.param('id')) as PlayerDeath[];
      
      for(let death of player_deaths) {
        let description = '';

        const lasthit = death.is_player ? this.utilsService.generatePlayerLink(remote_url, death.killed_by) : death.killed_by;
        
        description = `Killed at level ${death.level} by ${lasthit}`;

        if(death.unjustified) {
					description += ' <span style="color: red; font-style: italic;">(unjustified)</span>';
				}

				if(death.mostdamage_by !== death.killed_by)
				{
					const mostdmg = death.mostdamage_is_player ? this.utilsService.generatePlayerLink(remote_url, death.mostdamage_by) : death.mostdamage_by;
					description += ` and by ${mostdmg}`;

					if (death.mostdamage_unjustified) {
						description +=  ' <span style="color: red; font-style: italic;">(unjustified)</span>';
					}
				}
				else {
					description +=  " <b>(soloed)</b>";
				}

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
