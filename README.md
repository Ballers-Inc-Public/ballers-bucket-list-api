[![General Assembly Logo](https://camo.githubusercontent.com/1a91b05b8f4d44b5bbfb83abac2b0996d8e26c92/687474703a2f2f692e696d6775722e636f6d2f6b6538555354712e706e67)](https://generalassemb.ly/education/web-development-immersive)

# Balling Bucketlist API

The purpose of this README is to detail the specifications of the Balling Bucketlist API.  The core requirements of this project from an API perspective are as follows:
- Use MongoDB and Express to build an API.
- Create an API using at least 2 related models, one of which should be a user.
- Include all major CRUD functions in a RESTful API for at least one non-user model.
- Use authentication in your API to restrict access to appropriate users.

The README on the client repo includes additional details about the project's development, and can be found here: https://github.com/Ballers-Inc-Public/ballers-bucket-list-client

## URL

The API is deployed on heroku at the following location: https://infinite-garden-87904.herokuapp.com/

## Dependencies

Install with `npm install`.

-   [`express`](http://expressjs.com/)
-   [`mongoose`](http://mongoosejs.com/)

Dependencies are stored in [`package.json`](package.json).

JavaScript files are stored in [`app/controllers`](app/controllers)
 and [`app/models`](app/models).

Routes are stored in [`config/routes.js`](config/routes.js)

## Data Structure

Two models were created: Users and Goals.  The collections and associated attributes for each model are as follows:
- Users
  - Attributes: id, email, password
- Goals
  - Attributes: id, title, status

These two models are related, and user authentication was written so that the content in the goals table is restricted to the appropriate users.

### Authentication

| Verb   | URI Pattern            | Controller#Action |
|--------|------------------------|-------------------|
| POST   | `/sign-up`             | `users#signup`    |
| POST   | `/sign-in`             | `users#signin`    |
| PATCH  | `/change-password/:id` | `users#changepw`  |
| DELETE | `/sign-out/:id`        | `users#signout`   |

#### POST /sign-up

Request:

```sh
curl --include --request POST http://localhost:4741/sign-up \
  --header "Content-Type: application/json" \
  --data '{
    "credentials": {
      "email": "an@example.email",
      "password": "an example password",
      "password_confirmation": "an example password"
    }
  }'
```

```sh
scripts/sign-up.sh
```

Response:

```md
HTTP/1.1 201 Created
Content-Type: application/json; charset=utf-8

{
  "user": {
    "id": 1,
    "email": "an@example.email"
  }
}
```

#### POST /sign-in

Request:

```sh
curl --include --request POST http://localhost:4741/sign-in \
  --header "Content-Type: application/json" \
  --data '{
    "credentials": {
      "email": "an@example.email",
      "password": "an example password"
    }
  }'
```

```sh
scripts/sign-in.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "user": {
    "id": 1,
    "email": "an@example.email",
    "token": "33ad6372f795694b333ec5f329ebeaaa"
  }
}
```

#### PATCH /change-password/:id

Request:

```sh
curl --include --request PATCH http://localhost:4741/change-password/$ID \
  --header "Authorization: Token token=$TOKEN" \
  --header "Content-Type: application/json" \
  --data '{
    "passwords": {
      "old": "an example password",
      "new": "super sekrit"
    }
  }'
```

```sh
ID=1 TOKEN=33ad6372f795694b333ec5f329ebeaaa scripts/change-password.sh
```

Response:

```md
HTTP/1.1 204 No Content
```

#### DELETE /sign-out/:id

Request:

```sh
curl --include --request DELETE http://localhost:4741/sign-out/$ID \
  --header "Authorization: Token token=$TOKEN"
```

```sh
ID=1 TOKEN=33ad6372f795694b333ec5f329ebeaaa scripts/sign-out.sh
```

Response:

```md
HTTP/1.1 204 No Content
```

### Users

| Verb | URI Pattern | Controller#Action |
|------|-------------|-------------------|
| GET  | `/users`    | `users#index`     |
| GET  | `/users/1`  | `users#show`      |

#### GET /users

Request:

```sh
curl --include --request GET http://localhost:4741/users \
  --header "Authorization: Token token=$TOKEN"
```

```sh
TOKEN=33ad6372f795694b333ec5f329ebeaaa scripts/users.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "users": [
    {
      "id": 2,
      "email": "another@example.email"
    },
    {
      "id": 1,
      "email": "an@example.email"
    }
  ]
}
```

#### GET /users/:id

Request:

```sh
curl --include --request GET http://localhost:4741/users/$ID \
  --header "Authorization: Token token=$TOKEN"
```

```sh
ID=2 TOKEN=33ad6372f795694b333ec5f329ebeaaa scripts/user.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "user": {
    "id": 2,
    "email": "another@example.email"
  }
}
```

### Goals

| Verb   | URI Pattern         | Controller#Action |
|--------|---------------------|-------------------|
| GET    | `/goals`            | `goals#index`     |
| POST   | `/goals`            | `goals#create`    |
| PATCH  | `/goals/:id`        | `goals#update`    |
| DELETE | `/goals/:id`        | `goals#destroy`   |


#### GET /goals

Request:

```
API="http://localhost:4741"
URL_PATH="/goals"

curl "${API}${URL_PATH}" \
  --include \
  --request GET \
```

Response:

```md
HTTP/1.1 200 OK
X-Powered-By: Express
Access-Control-Allow-Origin: http://localhost:7165
Vary: Origin
Content-Type: application/json; charset=utf-8
Content-Length: 276
ETag: W/"114-FahAn14m9+ITMROu0LzEdrYaXN4"
Date: Wed, 17 May 2017 15:09:45 GMT
Connection: keep-alive
```


#### POST /goals

Request:

```
API="http://localhost:4741"
URL_PATH="/goals"
GOAL="This is an example goal"
TOKEN="$TOKEN"
STATUS="This is an example status"

curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "goal": {
      "title": "'"${GOAL}"'",
      "status": "'"${STATUS}"'"
    }
  }'

echo
```

Response:

```
HTTP/1.1 201 Created
X-Powered-By: Express
Access-Control-Allow-Origin: http://localhost:7165
Vary: Origin
Content-Type: application/json; charset=utf-8
Content-Length: 276
ETag: W/"114-vzgjoYdKYVzvHU67O/YLcFNMUes"
Date: Wed, 17 May 2017 15:02:12 GMT
Connection: keep-alive
```


#### PATCH /goals/id

Request:

```
TOKEN="$TOKEN"
TITLE="Updated title"
STATUS="Updated status"
ID="591c65f4b0b6727a315b7bbf"
API="http://localhost:4741"
URL_PATH="/goals"

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request PATCH \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "goal": {
      "title": "'"${TITLE}"'"
    }
  }'
```

Response:

```
HTTP/1.1 204 No Content
X-Powered-By: Express
Access-Control-Allow-Origin: http://localhost:7165
Vary: Origin
ETag: W/"a-bAsFyilMr4Ra1hIU5PyoyFRunpI"
Date: Wed, 17 May 2017 15:06:06 GMT
Connection: keep-alive
```


#### DELETE /goals/id

Request:

```
TOKEN="$TOKEN"
ID="591c65f4b0b6727a315b7bbf"
API="http://localhost:4741"
URL_PATH="/goals"

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request DELETE \
  --header "Authorization: Token token=${TOKEN}"
```

Response:

```
HTTP/1.1 200 OK
X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/"7f1b9688acb48e25a2a9fb9fbe591407"
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: a86d8325-07d2-4e22-9e5b-abb5c696af7b
X-Runtime: 0.017991
Vary: Origin
Transfer-Encoding: chunked
```


## [License](LICENSE)

1.  All content is licensed under a CC­BY­NC­SA 4.0 license.
1.  All software code is licensed under GNU GPLv3. For commercial use or
    alternative licensing, please contact legal@ga.co.
