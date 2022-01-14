import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import Database from '@ioc:Adonis/Lucid/Database'

export default class PlayerDeathsController {
  public async show({ request, response }: HttpContextContract) {
    try {
      const { remote_url } = request.body();

      console.log(request.body())

      const deaths: Object[] = [];

      const player_deaths = await Database
        .from('player_deaths')
        .select('id', 'date', 'level')
        .where('player_id', request.param('id'))
        .orderBy('date', 'desc')
        .limit(10);
      
      for(let death of player_deaths) {
        const killers = await Database
          .from('killers')
          .leftJoin('environment_killers', 'environment_killers.kill_id', '=', 'killers.id')
          .leftJoin('player_killers', 'player_killers.kill_id', '=', 'killers.id')
          .leftJoin('players', 'players.id', '=', 'player_killers.player_id')
          .select(
            'environment_killers.name as monster_name', 
            'players.name as player_name', 
            'players.deleted as player_exists',
          )
          .where('killers.death_id', death.id)
          .orderBy('killers.final_hit', 'desc')
          .orderBy('killers.id', 'asc')
          .limit(10);

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

            if(killer.player_exists && killer.player_exists === 0)
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
      return response.status(200).send({ result: deaths});

    } catch(err) {
      console.log('Error getPlayerDeaths Query: ', err);
      return response.status(400).send({ message: 'An error occurred, check the api console.'})
    }
  }
}
