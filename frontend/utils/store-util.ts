import { Store } from 'vuex';
import { getModule } from 'vuex-module-decorators';

import Auth from '~/store/auth';

import {
  Home as DashboardHome,
  News as DashboardNews,
  Accounts as DashboardAccounts,
  Character as DashboardCharacters,
  CharacterSkills as DashboardCharacterSkills,
  ShopCategory as DashboardShopCategory,
  ShopItem as DashboardShopItem
} from '~/store/dashboard'

import {
  News
} from '~/store/news'

import {
  Account,
  Register as AccountRegister,
  Character as CreateCharacter
} from '~/store/accounts'

import { 
  Character,
  Death,
  Items as CharacterItems,
  Skill,
  Storage
} from '~/store/character'

import { 
  Top5Players,
  Ranking
} from '~/store/highscores'

import {
  CreateGuild,
  Guild,
  GuildList,
  InviteGuild,
  ManageGuild
} from '~/store/guilds'

import {
  Online
} from '~/store/online'

import {
  Creatures
} from '~/store/creatures'

import {
  Items
} from '~/store/items'

import {
  Lastkills
} from '~/store/lastkills'

import {
  Shop,
  ShopCategorie
} from '~/store/shop'

let auth: Auth;

let dashboardHome: DashboardHome;
let dashboardNews: DashboardNews;
let dashboardAccounts: DashboardAccounts;
let dashboardCharacters: DashboardCharacters;
let dashboardCharacterSkills: DashboardCharacterSkills;
let dashboardShopCategory: DashboardShopCategory;
let dashboardShopItem: DashboardShopItem;

let news: News;

let account: Account;
let accountRegister: AccountRegister;
let createCharacter: CreateCharacter;

let character: Character;
let death: Death;
let characterItems: CharacterItems;
let skill: Skill;
let storage: Storage;

let top5Players: Top5Players;
let ranking: Ranking;

let createGuild: CreateGuild;
let guild: Guild;
let guildList: GuildList;
let inviteGuild: InviteGuild;
let manageGuild: ManageGuild;

let creatures: Creatures;

let items: Items;

let online: Online;

let lastkills: Lastkills;

let shop: Shop;
let shopCategorie: ShopCategorie;

const initializeStores = (store: Store<any>) => {
  auth = getModule(Auth, store);

  // Store Dashboard
  dashboardHome = getModule(DashboardHome, store);
  dashboardNews = getModule(DashboardNews, store);
  dashboardAccounts = getModule(DashboardAccounts, store);
  dashboardCharacters = getModule(DashboardCharacters, store);
  dashboardCharacterSkills = getModule(DashboardCharacterSkills, store);
  dashboardShopCategory = getModule(DashboardShopCategory, store);
  dashboardShopItem = getModule(DashboardShopItem, store);

  // Store News
  news = getModule(News, store);

  // Store Accounts
  account = getModule(Account, store);
  accountRegister = getModule(AccountRegister, store);
  createCharacter = getModule(CreateCharacter, store);

  // Store Character
  character = getModule(Character, store);
  death = getModule(Death, store);
  characterItems = getModule(CharacterItems, store);
  skill = getModule(Skill, store);
  storage = getModule(Storage, store);

  // Store Top5Players
  top5Players = getModule(Top5Players, store);
  ranking = getModule(Ranking, store);

  // Store Guilds
  createGuild = getModule(CreateGuild, store);
  guild = getModule(Guild, store);
  guildList = getModule(GuildList, store);
  inviteGuild = getModule(InviteGuild, store);
  manageGuild = getModule(ManageGuild, store);

  // Store Creatures
  creatures = getModule(Creatures, store);

  // Store Items
  items = getModule(Items, store);

  // Store Online
  online = getModule(Online, store);

  // Store Lastkills
  lastkills = getModule(Lastkills, store);

  // Store Shop
  shop = getModule(Shop, store);
  shopCategorie = getModule(ShopCategorie, store);
};

export {
  initializeStores,

  dashboardHome,
  dashboardNews,
  dashboardAccounts,
  dashboardCharacters,
  dashboardCharacterSkills,
  dashboardShopCategory,
  dashboardShopItem,

  auth,

  news,
  
  account,
  accountRegister,
  createCharacter,

  character,
  death,
  characterItems,
  skill,
  storage,

  top5Players,
  ranking,

  createGuild,
  guild,
  guildList,
  inviteGuild,
  manageGuild,
  
  creatures,
  
  items,
  
  online,

  lastkills,

  shop,
  shopCategorie
};