# BACK-END

<h2> 🍸 Build Setup </h2>

```bash
# go to paste
$ cd backend

# Create container with MySQL
$ docker-compose up -d

# Create your .env file using .env.example as an example

# install dependencies
$ npm install

# Create database structure
$ node ace migration:run

# Create account admin and character sample
$ node ace db:seed

# server with changes watcher
$ npm run dev

# build for production and launch server
$ npm run build
$ npm run start
```

## 🕵🏾‍♂️ Routes Authorization (Login/Logout)

| METHOD | ENDPOINT | DESCRIPTION |
| :----- | :------- | :---------- |
| POST   | /auth    | Login       |
| DELETE | /auth    | Logout      |

<br>

## 🕵🏾‍♂️ Routes News

| METHOD | ENDPOINT                | DESCRIPTION |
| :----- | :---------------------- | :---------- |
| GET    | /news/list/:page/:limit | Get news    |

<br>

## 🕵🏾‍♂️ Routes Account

| METHOD | ENDPOINT                       | DESCRIPTION                     |
| :----- | :----------------------------- | :------------------------------ |
| POST   | /accounts/register             | Register new account            |
| POST   | /accounts/forgot-password      | Generate code and sent to email |
| GET    | /accounts/forgot-password/:key | Validate Code                   |
| PUT    | /accounts/forgot-password      | Update Password                 |
| GET    | /accounts/characters/:id       | Get characters to account       |
| POST   | /accounts/create-character     | Create new character            |

<br>

## 🕵🏾‍♂️ Routes Players

| METHOD | ENDPOINT                 | DESCRIPTION                |
| :----- | :----------------------- | :------------------------- |
| GET    | /player/:name            | Get Player Infos           |
| GET    | /player/:id/skills       | Get Player Skills          |
| POST   | /player/:id/deaths       | Get Player Last 10 Deaths  |
| GET    | /player/:id/items        | Get Player Items equipment |
| GET    | /player/:id/storage/:key | Get Player Storage         |
| GET    | /player/:id/storages     | Get Player Storages        |
| GET    | /player/change-name      | Status system              |
| POST   | /player/change-name      | Change character name      |
| POST   | /player/delete           | Delete character           |

<br>

## 🕵🏾‍♂️ Routes Highscores

| METHOD | ENDPOINT                       | DESCRIPTION       |
| :----- | :----------------------------- | :---------------- |
| GET    | /highscores                    | Get Top 5 Players |
| POST   | /highscores/:page/:limit/:type | Ranking Players   |

<br>

## 🕵🏾‍♂️ Routes Online

| METHOD | ENDPOINT | DESCRIPTION        |
| :----- | :------- | :----------------- |
| GET    | /online  | Get Players Online |

<br>

## 🕵🏾‍♂️ Routes Lastkills

| METHOD | ENDPOINT                | DESCRIPTION    |
| :----- | :---------------------- | :------------- |
| POST   | /lastkills/:page/:limit | Get last kills |

<br>

## 🕵🏾‍♂️ Routes Guilds

| METHOD | ENDPOINT                     | DESCRIPTION             |
| :----- | :--------------------------- | :---------------------- |
| GET    | /guilds/:page/:limit         | Get all guilds          |
| GET    | /guild/view/:name            | Get guild info          |
| GET    | /guild/players-without-guild | Get guild info          |
| POST   | /guild/create-guild          | Create Guild            |
| POST   | /guild/invite                | Invite character        |
| POST   | /guild/invites               | Get all invites         |
| POST   | /guild/accept-invite         | Accept invite character |
| POST   | /guild/cancel-invite         | Cancel invite character |
| POST   | /guild/leave                 | Leave guild             |
| POST   | /guild/pass-leadership       | Pass Leadership         |
| POST   | /guild/change-motd           | Change Motd             |
| POST   | /guild/change-rank           | Change Rank of Member   |
| POST   | /guild/change-description    | Change Description      |
| POST   | /guild/delete                | Delete Guild            |

<br>

## 🕵🏾‍♂️ Routes Creatures

| METHOD | ENDPOINT                | DESCRIPTION       |
| :----- | :---------------------- | :---------------- |
| GET    | /creatures/:page/:limit | Get All Creatures |
| GET    | /creatures/xml          | Loading Creatures |

<br>

## 🕵🏾‍♂️ Routes Items

| METHOD | ENDPOINT     | DESCRIPTION   |
| :----- | :----------- | :------------ |
| GET    | /items/xml   | Loading Items |
| GET    | /items/:type | Get Items     |

<br>

## 🕵🏾‍♂️ Routes Shop

| METHOD | ENDPOINT                      | DESCRIPTION    |
| :----- | :---------------------------- | :------------- |
| GET    | /shop/offers/:categorie       | Get offers     |
| GET    | /shop/categories/:page/:limit | Get categories |
| POST   | /shop/purchase                | Purchase Items |

<br>

## 🕵🏾‍♂️ Routes Dashboard

| METHOD | ENDPOINT                  | DESCRIPTION                               |
| :----- | :------------------------ | :---------------------------------------- |
| GET    | /dashboard/accounts       | Get Total Accounts                        |
| GET    | /dashboard/players        | Get Total PLayers                         |
| GET    | /dashboard/guilds         | Get Total Guilds                          |
| GET    | /dashboard/premium-points | Get accounts with the most premium points |
| GET    | /dashboard/vocation       | Get all vocations by id                   |

<br>

## 🕵🏾‍♂️ Routes Dashboard - Accounts

| METHOD | ENDPOINT                 | DESCRIPTION    |
| :----- | :----------------------- | :------------- |
| GET    | /dashboard/account/:name | Find account   |
| POST   | /dashboard/account       | Update account |

<br>

## 🕵🏾‍♂️ Routes Dashboard - Characters

| METHOD | ENDPOINT                        | DESCRIPTION            |
| :----- | :------------------------------ | :--------------------- |
| GET    | /dashboard/character/:name      | Find character         |
| GET    | /dashboard/character-skills/:id | Find character         |
| POST   | /dashboard/character            | Update character       |
| POST   | /dashboard/character-skills     | Update characterSkills |

<br>

## 🕵🏾‍♂️ Routes Dashboard - News

| METHOD | ENDPOINT                         | DESCRIPTION           |
| :----- | :------------------------------- | :-------------------- |
| GET    | /news/listDashboard/:page/:limit | Get news to Dashboard |
| POST   | /news/create                     | Create new post       |
| GET    | /news/find/:id                   | Find post             |
| PATCH  | /news/edit                       | Update post           |

<br>

## 🕵🏾‍♂️ Routes Dashboard - Shop

| METHOD | ENDPOINT                   | DESCRIPTION           |
| :----- | :------------------------- | :-------------------- |
| GET    | /shop/category/list        | Get all categories    |
| POST   | /shop/category/create      | Create new category   |
| GET    | /shop/category/find:id     | Find category         |
| PUT    | /shop/category/update      | Update category       |
| DELETE | /shop/category/destroy/:id | Delete category       |
| GET    | /shop/item/list            | Get all items         |
| POST   | /shop/item/create          | Create new offer item |
| GET    | /shop/item/find:id         | Find offer item       |
| PUT    | /shop/item/update          | Update offer item     |
| DELETE | /shop/item/destroy/:id     | Delete offer item     |
