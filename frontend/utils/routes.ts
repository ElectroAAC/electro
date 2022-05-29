export const routesAccount = [
  {
    text: "Manage account",
    to: "/accounts"
  },
  {
    text: "Create Character",
    to: "/accounts/create-character"
  },
]

export const routesCommunity = [
  {
    icon: 'mdi-human-queue',
    text: "Who is online?",
    to: "/online"
  },
  {
    icon: 'mdi-skull-outline',
    text: "Lastkills",
    to: "/lastkills"
  },
  {
    icon: 'mdi-rodent',
    text: "Creatures",
    to: "/creatures"
  },
]

export const routesGuild = [
  {
    icon: 'mdi-khanda',
    text: "All Guilds",
    to: "/guilds"
  },
  {
    icon: 'mdi-plus-thick',
    text: "Create Guild",
    to: "/guilds/create"
  },
]

export const routesShop = [
  {
    icon: 'mdi-offer',
    text: "Offers",
    to: "/shop"
  },
  {
    icon: 'mdi-cart-variant',
    text: "My Cart",
    to: "/shop/checkout"
  },
]

export const routesDashboard = [
  {
    icon: 'mdi-home',
    text: 'Home',
    to: '/dashboard',
  },
  {
    icon: 'mdi-view-dashboard-outline',
    text: 'Customize',
    to: ''
  },
  {
    icon: 'mdi-newspaper',
    text: 'News',
    to: '/dashboard/news'
  },
  {
    icon: 'mdi-account-multiple',
    text: 'Accounts',
    to: '/dashboard/accounts'
  },
  {
    icon: 'mdi-account-cowboy-hat',
    text: 'Players',
    to: '/dashboard/characters'
  },
  {
    icon: 'mdi-khanda',
    text: 'Guilds',
    to: ''
  },
  {
    icon: 'mdi-axe',
    text: 'Items',
    to: ''
  },
  {
    icon: 'mdi-rodent',
    text: 'Monsters',
    to: ''
  },
  {
    icon: 'mdi-cart',
    text: 'Shop',
    to: '',
    subLinks: [
      {
        icon: 'mdi-cart-variant',
        text: "Categories",
        to: "/dashboard/shop/categories"
      },
      {
        icon: 'mdi-cart-variant',
        text: "Items",
        to: "/dashboard/shop/items"
      },
    ]
  },
  {
    icon: 'mdi-text-box-outline',
    text: 'Logs',
    to: ''
  },
];