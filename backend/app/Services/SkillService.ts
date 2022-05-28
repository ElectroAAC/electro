import Database from '@ioc:Adonis/Lucid/Database'

class Skill {
  public async updateCharacterSkill(character_id: number, skills: any): Promise<Object[]> {  
    try {
      if (skills.skill_name === 'skill_fist') {
        return await Database
          .from('players')
          .where('id', '=', character_id)
          .update({
            skill_fist: skills.value,
            skill_fist_tries: skills.count
          });
      }
      else if (skills.skill_name === 'skill_club') {
        return await Database
          .from('players')
          .where('id', '=', character_id)
          .update({
            skill_club: skills.value,
            skill_club_tries: skills.count
          });
      }
      else if (skills.skill_name === 'skill_sword') {
        return await Database
          .from('players')
          .where('id', '=', character_id)
          .update({
            skill_sword: skills.value,
            skill_sword_tries: skills.count
          });
      }
      else if (skills.skill_name === 'skill_axe') {
        return await Database
          .from('players')
          .where('id', '=', character_id)
          .update({
            skill_axe: skills.value,
            skill_axe_tries: skills.count
          });
      }
      else if (skills.skill_name === 'skill_dist') {
        return await Database
          .from('players')
          .where('id', '=', character_id)
          .update({
            skill_dist: skills.value,
            skill_dist_tries: skills.count
          });
      }
      else if (skills.skill_name === 'skill_shielding') {
        return await Database
          .from('players')
          .where('id', '=', character_id)
          .update({
            skill_shielding: skills.value,
            skill_shielding_tries: skills.count
          });
      }
      else if (skills.skill_name === 'skill_fishing') {
        return await Database
          .from('players')
          .where('id', '=', character_id)
          .update({
            skill_fishing: skills.value,
            skill_fishing_tries: skills.count
          });
      }
      else {
        return [{}];
      }
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
          'skill_shielding'
        )
        .where('id', '=', character_id);
    } catch (err) {
      console.log(err);
      return err;
    }
  }
}

export { Skill, SkillView };