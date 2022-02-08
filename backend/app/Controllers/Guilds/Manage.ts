import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import { 
  DeleteValidator,
  DescriptionValidator,
  MotdValidator 
} from 'App/Validators/Guilds/Manage'

import {
  Guild,
  GuildRepository
} from 'App/Services'

export default class ManageController {
  public guild: Guild = new Guild();
  public guildRepository: GuildRepository = new GuildRepository();

  public async changeMotd(ctx: HttpContextContract) {
    try {
      const data = await ctx.request.validate(MotdValidator);

      const isLeader = await this.guild.isLeader(data.account_id, data.guild_id);

      if (!isLeader)
        return ctx.response.status(404).send({ message: "You cannot manage a guild that is not yours." });

      const affectedRows = await this.guild.updateMotd(data.guild_id, data.motd);

      if (!affectedRows)
        return ctx.response.status(404).send({ message: "There was an error updating the guild. Contact the administrator."});

      return ctx.response.status(200).send({ status: 200, result: "Guild MOTD successfully updated!" });
    } catch(err) {
      console.log('Error getGuilds: ', err);
      return ctx.response.status(400).send({ message: 'An error occurred, check the api console.'})
    }
  }

  public async changeDescription(ctx: HttpContextContract) {
    try {
      const data = await ctx.request.validate(DescriptionValidator);

      const isLeader = await this.guild.isLeader(data.account_id, data.guild_id);

      if (!isLeader)
        return ctx.response.status(404).send({ message: "You cannot manage a guild that is not yours." });

      const affectedRows = await this.guild.updateDescription(data.guild_id, data.description);

      if (!affectedRows)
        return ctx.response.status(404).send({ message: "There was an error updating the guild. Contact the administrator."});

      return ctx.response.status(200).send({ status: 200, result: "Guild Description successfully updated!" });
    } catch(err) {
      console.log('Error getGuilds: ', err);
      return ctx.response.status(400).send({ message: 'An error occurred, check the api console.'})
    }
  }

  public async delete(ctx: HttpContextContract) {
    try {
      const data = await ctx.request.validate(DeleteValidator);

      const isLeader = await this.guild.isLeader(data.account_id, data.guild_id);

      if (!isLeader)
        return ctx.response.status(404).send({ message: "You cannot manage a guild that is not yours." });

      const affectedRows = await this.guildRepository.delete(data.guild_id);

      if (!affectedRows)
        return ctx.response.status(404).send({ message: "There was an error deleting the guild. Contact the administrator."});

      return ctx.response.status(200).send({ status: 200, result: "Guild successfully deleted!" });
    } catch(err) {
      console.log('Error getGuilds: ', err);
      return ctx.response.status(400).send({ message: 'An error occurred, check the api console.'})
    }
  }
}
