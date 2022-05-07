import Database from '@ioc:Adonis/Lucid/Database'

class Skill {
  public async updateCharacterSkill(character_id: number, skills: any): Promise<Object[]> {  
    try {
      return await Database
        .from('player_skills')
        .where('player_id', '=', character_id)
        .andWhere('skillid', '=', skills.skillid)
        .update({
          skillid: skills.skillid,
          value: skills.value,
          count: skills.count
        });
    } catch (err) {
      console.log(err);
      return err;
    }
  }
}

class SkillView {
  public async getCharacterSkills(character_id: number): Promise<Object[]> {  
    try {
      return await Database
        .from('players')
        .select(
          'skill_fist',
          'skill_club',
          'skill_sword',
          'skill_axe',
          'skill_dist',
          'skill_shielding',
          'skill_fishing'
        )
        .where('id', '=', character_id);
    } catch (err) {
      console.log(err);
      return err;
    }
  }
}

export { Skill, SkillView };