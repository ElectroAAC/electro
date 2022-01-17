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

# server with changes watcher
$ npm run dev

# build for production and launch server
$ npm run build
$ npm run start
```

##  🕵🏾‍♂️  Routes Account

| METHOD | ENDPOINT                        | DESCRIPTION                           |
| :----- | :-------------------------------| :------------------------------------ |
| POST   | /accounts/register              | Register new account                  |
| POST   | /accounts/forgot-password       | Generate code and sent to email       |
| GET    | /accounts/forgot-password/:key  | Validate Code                         |
| PUT    | /accounts/forgot-password       | Update Password                       |
| GET    | /accounts/characters/:id        | Get characters to account             |
| POST   | /accounts/create-character      | Create new character                  |
| GET    | /accounts/change-character-name | Status system                         |
| POST   | /accounts/change-character-name | Change character name                 |

<br>

##  🕵🏾‍♂️  Routes Authorization (Login/Logout)

| METHOD | ENDPOINT                   | DESCRIPTION                           |
| :----- | :------------------------- | :------------------------------------ |
| POST   | /auth                      | Login                                 |
| DELETE | /auth                      | Logout                                |


<br>

##  🕵🏾‍♂️  Routes Highscores

| METHOD | ENDPOINT                   | DESCRIPTION                           |
| :----- | :------------------------- | :------------------------------------ |
| GET    | /highscores                | Get Top 5 Players                     |


<br>

##  🕵🏾‍♂️  Routes Players

| METHOD | ENDPOINT                   | DESCRIPTION                           |
| :----- | :------------------------- | :------------------------------------ |
| GET    | /player/:name              | Get Player Infos                      |
| GET    | /player/:id/skills         | Get Player Skills                     |
| GET    | /player/:id/storage/:key   | Get Player Storage                    |
| POST   | /player/:id/deaths         | Get Player Last 10 Deaths             |
| GET    | /player/:id/items          | Get Player Items equipment            |


<br>

##  🕵🏾‍♂️  Routes Dashboard

| METHOD | ENDPOINT                   | DESCRIPTION                               |
| :----- | :------------------------- | :-----------------------------------------|
| GET    | /dashboard/accounts        | Get Total Accounts                        |
| GET    | /dashboard/players         | Get Total PLayers                         |
| GET    | /dashboard/guilds          | Get Total Guilds                          |
| GET    | /dashboard/premium-points  | Get accounts with the most premium points |
| GET    | /dashboard/vocation        | Get all vocations by id                   |