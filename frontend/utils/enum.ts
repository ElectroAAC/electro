/**
 * Value: SKILL_ID
 * Text: Name Skill
 * Example to register: { value: 0, text: "Attack Speed" }
 */
export const skillName = [
  { value: 0, text: "Attack Speed" },
  { value: 1, text: "Club" },
  { value: 2, text: "Sword" },
  { value: 3, text: "Axe" },
  { value: 4, text: "Distance" },
  { value: 5, text: "Shielding" },
  { value: 6, text: "Fishing" },
]

/**
 * @initial_id (Number)   =   INITIAL VOCATION ID
 * @last_id    (Number)   =   LAST VOCATION ID
 * @Text       (String)   =   NAME VOCATION
 * The initial_value_id is the 1st id of your vocations, 
 * the last_vocation_id is the last id referring to that vocation, 
 * in ascending order. Example: If my Knight vocation 
 * starts at id 1 and goes up to 9, 
 * my initial_value_id will be 1 and last_vocation_id will be 9.
 * Example to register: { initial_id: 1, last_id: 17, text: "Knight Sample" }
 */
export const vocations = [
  { 
    initial_id: 1, 
    last_id: 17, 
    text: "Dragon_Slayer" 
  }, 
  { 
    initial_id: 18, 
    last_id: 31, 
    text: "Winter" 
  }, 
  { 
    initial_id: 32, 
    last_id: 46, 
    text: "Barbarian" 
  }, 
  { 
    initial_id: 47, 
    last_id: 58, 
    text: "Mage" 
  },
  { 
    initial_id: 59, 
    last_id: 67, 
    text: "Mercenary" 
  },
  { 
    initial_id: 68, 
    last_id: 71, 
    text: "Warrior" 
  },
]

export const sex = [
  { value: 0, text: "Male" },
  { value: 1, text: "Female" }
]

export const skulls = [
  { value: 1, text: "None" },
  { value: 2, text: "Yellow" },
  { value: 3, text: "Green" },
  { value: 4, text: "White" },
  { value: 5, text: "Red" },
  { value: 6, text: "Black" },
  { value: 7, text: "Orange" },
]

export const accountGroups = [
  { value: 1, text: "Player" },
  { value: 6, text: "Admin" },
]

export const characterGroups = [
  { value: 1, text: "Player" },
  { value: 2, text: "Tutor" },
  { value: 3, text: "Senior Tutor" },
  { value: 4, text: "GM" },
  { value: 5, text: "CM" },
  { value: 6, text: "Admin" },
]