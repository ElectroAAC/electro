import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import Database from '@ioc:Adonis/Lucid/Database'

export default class LastKillsController {
  public async show({ request, response }: HttpContextContract) {
    try {
      const { remote_url } = request.body();
      
      let players_deaths_count = 0;

      const last_kills: Object[] = [];

      const playersDeath = await Database
        .from('player_deaths')
        .innerJoin('players', 'players.id', 'player_deaths.player_id')
        .select('player_deaths.id', 'player_deaths.date', 'player_deaths.level', 'players.name')
        .orderBy('player_deaths.date', 'desc')
        .paginate(request.param('page', 1), request.param('limit'));
      
      if (!playersDeath.length) {
        return response.status(404).send({ message: 'There are no recorded deaths.' });
      }

      for(let death of playersDeath) {
        players_deaths_count++;

        let killers_string = death.name;

        const killers = await Database
          .from('killers')
          .leftJoin('environment_killers', 'environment_killers.kill_id', 'killers.id')
          .leftJoin('player_killers', 'player_killers.kill_id', 'killers.id')
          .leftJoin('players', 'players.id', 'player_killers.player_id')
          .select('environment_killers.name AS monster_name', 'players.name AS player_name', 'players.deleted AS player_exists')
          .where('killers.death_id', '=', death.id)
          .orderBy('killers.final_hit', 'desc');

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
      return response.status(200).send({ status: 200, last_kills});
    } catch(err) {
      console.log('Error getPlayersDeaths Query: ', err);
      return response.status(400).send({ error: 'An error occurred, check the api console.'});
    }
  }
}
